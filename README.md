# STAIR Lab Website

Visit **[stair.cs.stanford.edu](https://stair.cs.stanford.edu)**

## Development

```bash
bundle exec jekyll serve
```

## Deployment

1. Push to GitHub
2. GitHub Actions builds the site automatically
3. Copy to AFS: `cp -r _site/* /afs/cs/group/koyejolab/www`
