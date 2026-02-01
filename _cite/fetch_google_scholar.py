"""
Fetch publications from Google Scholar profile and update sources.yaml
Usage: python fetch_google_scholar.py
"""

import yaml
import time
import random
from pathlib import Path

try:
    from scholarly import scholarly
except ImportError:
    print("Installing scholarly library...")
    import subprocess
    subprocess.check_call(["pip", "install", "scholarly"])
    from scholarly import scholarly


# Google Scholar profile ID (from URL parameter 'user=')
SCHOLAR_ID = "EaaOeJwAAAAJ"

# Output file
SOURCES_FILE = Path(__file__).parent.parent / "_data" / "sources.yaml"


def fetch_publications(scholar_id: str, max_pubs: int = 100) -> list:
    """Fetch publications from a Google Scholar profile."""
    print(f"Fetching publications for scholar ID: {scholar_id}")

    # Get the author
    author = scholarly.search_author_id(scholar_id)
    author = scholarly.fill(author, sections=['publications'])

    publications = []
    pubs = author.get('publications', [])

    print(f"Found {len(pubs)} publications")

    for i, pub in enumerate(pubs[:max_pubs]):
        # Add delay to avoid rate limiting
        if i > 0:
            time.sleep(random.uniform(0.3, 0.8))
        if i > 0 and i % 10 == 0:
            print(f"  Processed {i}/{min(max_pubs, len(pubs))}...")

        # Fill publication to get full details including authors
        try:
            pub = scholarly.fill(pub)
        except Exception as e:
            print(f"  Warning: Could not fill pub {i}: {e}")

        bib = pub.get('bib', {})

        # Get basic info
        title = bib.get('title', '')
        year = bib.get('pub_year', '')
        authors = bib.get('author', '')
        venue = bib.get('citation', '') or bib.get('venue', '') or bib.get('journal', '') or bib.get('conference', '')

        # Try to get DOI or arXiv ID from the publication
        pub_url = pub.get('pub_url', '')

        entry = {
            'title': title,
            'year': year,
        }

        # Add authors as a list
        if authors:
            # Authors come as "Author1 and Author2 and Author3" format
            author_list = [a.strip() for a in authors.replace(' and ', ', ').split(', ') if a.strip()]
            if author_list:
                entry['authors'] = author_list

        # Add venue/publisher
        if venue:
            entry['publisher'] = venue

        # Try to extract identifiers
        if 'arxiv.org' in pub_url.lower():
            # Extract arXiv ID
            arxiv_id = extract_arxiv_id(pub_url)
            if arxiv_id:
                entry['id'] = f"arXiv:{arxiv_id}"
        elif pub_url:
            entry['link'] = pub_url

        publications.append(entry)

    return publications


def extract_arxiv_id(url: str) -> str:
    """Extract arXiv ID from URL."""
    import re
    # Match patterns like arxiv.org/abs/1234.56789 or arxiv.org/pdf/1234.56789
    match = re.search(r'arxiv\.org/(?:abs|pdf)/(\d+\.\d+)', url)
    if match:
        return match.group(1)
    return ""


def load_existing_sources() -> list:
    """Load existing sources from YAML file."""
    if SOURCES_FILE.exists():
        with open(SOURCES_FILE, 'r') as f:
            return yaml.safe_load(f) or []
    return []


def save_sources(sources: list):
    """Save sources to YAML file."""
    with open(SOURCES_FILE, 'w') as f:
        yaml.dump(sources, f, default_flow_style=False, allow_unicode=True, sort_keys=False)


def merge_publications(existing: list, new_pubs: list) -> list:
    """Merge new publications with existing sources, avoiding duplicates."""
    # Get existing IDs and titles for deduplication
    existing_ids = set()
    existing_titles = set()

    for src in existing:
        if 'id' in src:
            existing_ids.add(src['id'].lower())
        if 'title' in src:
            existing_titles.add(src['title'].lower().strip())

    # Add new publications that don't exist
    added = 0
    for pub in new_pubs:
        pub_id = pub.get('id', '').lower()
        pub_title = pub.get('title', '').lower().strip()

        # Skip if already exists
        if pub_id and pub_id in existing_ids:
            continue
        if pub_title and pub_title in existing_titles:
            continue

        # Skip if no title
        if not pub.get('title'):
            continue

        # Create source entry - always include title
        entry = {'title': pub['title']}

        if pub.get('id'):
            entry['id'] = pub['id']
        if pub.get('link'):
            entry['link'] = pub['link']
        if pub.get('year'):
            entry['date'] = f"{pub['year']}-01-01"
        if pub.get('authors'):
            entry['authors'] = pub['authors']
        if pub.get('publisher'):
            entry['publisher'] = pub['publisher']

        existing.append(entry)
        added += 1

        if pub_id:
            existing_ids.add(pub_id)
        if pub_title:
            existing_titles.add(pub_title)

    print(f"Added {added} new publications")
    return existing


def main():
    print("=" * 50)
    print("Google Scholar Publication Fetcher")
    print("=" * 50)

    # Fetch from Google Scholar
    try:
        new_pubs = fetch_publications(SCHOLAR_ID)
    except Exception as e:
        print(f"Error fetching from Google Scholar: {e}")
        print("This may be due to rate limiting. Try again later.")
        return

    # Load existing sources
    existing = load_existing_sources()
    print(f"Loaded {len(existing)} existing sources")

    # Merge
    merged = merge_publications(existing, new_pubs)

    # Save
    save_sources(merged)
    print(f"Saved {len(merged)} total sources to {SOURCES_FILE}")

    print("\nDone! Now run 'python cite.py' to generate citations.")


if __name__ == "__main__":
    main()
