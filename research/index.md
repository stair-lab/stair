---
title: Research
---

# {% include icon.html icon="fa-solid fa-microscope" %}Research

Our research interests are in developing the principles and practice of trustworthy machine learning. Some recent highlights include (i) robust federated machine learning, and (ii) metric elicitation; selecting more effective machine learning metrics via human interaction, primarily applied to ML fairness. Our applied research includes applications to cognitive neuroimaging, healthcare, and biomedical imaging. Some recent highlights include (i) generative models, and (ii) risk-scoring and prediction models for X-rays and fMRI.

## (Robust) Distributed and Federated Machine Learning

Distributed data-centers and devices such as smart cars, smartphones, wearable devices, and smart sensors increasingly collect massive and diverse data. To this end, there is a growing interest in training machine learning models jointly across data centers without explicitly sharing data. Along similar lines, there is a trend towards on-device training of machine-learning models jointly across edge devices. However, despite some obvious benefits, distributed training and federated learning create new challenges for private and secure machine learning, as distributed devices are more susceptible to new privacy and security attacks. We are developing novel algorithmic and computational approaches to ensure the privacy and security of federated and distributed machine learning.
{% capture robust_distributed %}
**CSER: Communication-efficient SGD with Error Reset**  
Cong Xie, Shuai Zheng, Oluwasanmi Koyejo, Indranil Gupta, Mu Li, Haibin Lin  
Neural Information Processing Systems (NeurIPS), 2020  
[[preprint]](https://arxiv.org/abs/2007.13221)  
**Zeno++: Robust Asynchronous SGD with an Arbitrary Number of Byzantine Workers**  
Cong Xie, Sanmi Koyejo, and Indranil Gupta  
International Conference on Machine Learning (ICML), 2020  
[[preprint]](https://arxiv.org/abs/1903.07020)  
[ML] **Asynchronous Federated Optimization**  
Cong Xie, Sanmi Koyejo, and Indranil Gupta  
OPT 2020 workshop, NeurIPS 2020  
[[preprint]](https://arxiv.org/abs/1903.03934)  
**Fall of empires: Breaking byzantine-tolerant SGD by inner product manipulation**  
Cong Xie, Sanmi Koyejo, and Indranil Gupta.  
Conference on Uncertainty in Artificial Intelligence (UAI), 2019  
[[preprint]](https://arxiv.org/abs/1903.03936)  
**Practical distributed learning: Secure machine learning with communication-efficient local updates**  
Cong Xie, Oluwasanmi Koyejo, and Indranil Gupta.  
European Conference on Machine Learning and Principles and Practice of Knowledge Discovery in Databases (ECML PKDD)  
[[preprint]](https://arxiv.org/abs/1903.06996)  
{% endcapture %}

{% include yellow-box.html type="warning" content=robust_distributed%}

## Learning with Complex Metrics

Real-world machine learning often requires sophisticated evaluation metrics, many of which are non-decomposable, e.g., AUC, F-measure. This is in contrast to decomposable metrics such as accuracy, which can be computed as an empirical average. Indeed, non-decomposability is the primary source of difficulty in designing efficient algorithms that can optimize complex metrics. We study predictive methods from first principles and derive novel, efficient, statistically consistent algorithms that improve empirical performance.

{% capture complex_metrics %}

**Fairness with Overlapping Groups**  
Forest Yang, Moustapha Cisse, and Sanmi Koyejo  
Neural Information Processing Systems (NeurIPS), 2020  
[[preprint]](https://arxiv.org/abs/2006.13485)

**On the Consistency of Top-k Surrogate Losses**  
Forest Yang and Sanmi Koyejo  
[[preprint]](https://arXiv.org/abs/1901.11141)

**Binary Classification with Karmic, Threshold-Quasi-Concave Metrics**  
Bowei Yan, Oluwasanmi Koyejo, Kai Zhong and Pradeep Ravikumar.  
International Conference on Machine Learning (ICML), 2018  
[[url]](http://proceedings.mlr.press/v80/yan18b.html)

**Consistency Analysis for Binary Classification Revisited**  
Krzysztof Dembczynski, Wojciech Kotlowski, Oluwasanmi Koyejo, and Nagarajan Natarajan.  
International Conference on Machine Learning (ICML), 2017  
[[url]](http://proceedings.mlr.press/v70/dembczynski17a.html)

**Consistent binary classification with generalized performance metrics**  
Oluwasanmi Koyejo\*, Nagarajan Natarajan\*, Pradeep Ravikumar, and Inderjit Dhillon  
Advances in Neural Information Processing Systems (NIPS) 27, 2014 (Spotlight)  
[[url]](http://papers.nips.cc/paper/5454-consistent-binary-classification-with-generalized-performance-metrics)  
{% endcapture %}

{% include yellow-box.html type="warning" content=complex_metrics%}

## Metric Elicitation

What metric (equiv. cost function, loss function) should a machine learning model optimize? Selecting a suitable metric for real-world machine learning applications remains an open problem, as default metrics such as classification accuracy often do not capture tradeoffs relevant to downstream decision-making. Unfortunately, there needs to be more formal guidance in the machine learning literature on selecting appropriate metrics. We are developing formal interactive strategies by which a practitioner may discover which metric to optimize, such that it recovers user or expert preferences. We are particularly interested in applications to ML fairness.

{% capture metric_elicitation %}
**Quadratic Metric Elicitation with Application to Fairness**  
Gaurush Hiranandani, Jatin Mathur, Harikrishna Narasimhan and Oluwasanmi Koyejo  
Preprint, 2020  
[[preprint]](https://arxiv.org/abs/2011.01516)

**Fair Performance Metric Elicitation**  
Gaurush Hiranandani, Harikrishna Narasimhan, Oluwasanmi Koyejo  
Neural Information Processing Systems (NeurIPS), 2020  
[[preprint]](https://arxiv.org/abs/2006.12732)

**Multiclass Performance Metric Elicitation**  
Gaurush Hiranandani, Shant Boodaghians, Ruta Mehta, and Oluwasanmi Koyejo  
Neural Information Processing Systems (NeurIPS), 2019  
[[url]](https://papers.nips.cc/paper/9133-multiclass-performance-metric-elicitation)

**Performance metric elicitation from pairwise classifier comparisons**  
Gaurush Hiranandani, Shant Boodaghians, Ruta Mehta, and Oluwasanmi Koyejo  
International Conference on Artificial Intelligence and Statistics (AISTATS), 2019  
[[preprint]](https://arXiv.org/abs/1806.01827)  
{% endcapture %}

{% include yellow-box.html type="warning" content=metric_elicitation %}

## Probabilistic Graphical Models for Spatio-temporal Data

Spatio-temporal data are ubiquitous in science and engineering applications. We are pursuing various techniques for modeling such datasets, mainly using probabilistic graphical models and other graph-based analyses. We primarily use these tools to enable the scientific study and predictive modeling of brain networks. Of particular interest are novel methods that address robustness issues, e.g., confounding and novel distributed computation approaches.

{% capture graphical_models %}
**Estimating Differential Latent Variable Graphical Models with Applications to Brain Connectivity**  
Sen Na, Mladen Kolar, and Oluwasanmi Koyejo.  
Biometrika, 2020  
[[preprint]](https://arXiv.org/abs/1909.05892)
[[url]](https://academic.oup.com/biomet/advance-article-abstract/doi/10.1093/biomet/asaa066/5901536)  
**Partially linear additive Gaussian graphical models**  
Sinong Geng, Minhao Yan, Mladen Kolar, and Sanmi Koyejo.  
International Conference on Machine Learning (ICML) pages 2180-2190, 2019  
[[url]](http://proceedings.mlr.press/v97/geng19a.html)  
**Bayesian structure learning for dynamic brain connectivity**  
Michael Riis Andersen, Lars Kai Hansen, Ole Winther, Russell A. Poldrack, and Oluwasanmi Koyejo.  
International conference on Artificial Intelligence and Statistics (AISTATS), 2018  
[[url]](http://proceedings.mlr.press/v84/andersen18a.html)  
**The Dynamics of Functional Brain Networks: Integrated Network States during Cognitive Task Performance**  
J.M. Shine, P.G. Bissett, P.T. Bell, O. Koyejo, J.H. Balsters, K.J. Gorgolewski, C.A. Moodie and R. A. Poldrack  
Neuron (2016)  
[[url]](http://www.sciencedirect.com/science/article/pii/S0896627316305773)
[[preprint]](http://arXiv.org/abs/1511.02976)
[[code]](https://github.com/macshine/integration)  
**Temporal metastates are associated with differential patterns of time-resolved connectivity, network topology, and attention**  
James M. Shine, Oluwasanmi Koyejo, and Russell A. Poldrack  
Proceedings of the National Academy of Sciences (2016): 201604898.  
[[url]](http://www.ncbi.nlm.nih.gov/pubmed/27528672)
[[preprint]](http://arXiv.org/abs/1601.05065)
[[code]](https://github.com/macshine/metaconnectivity)  
{% endcapture %}

{% include yellow-box.html type="warning" content=graphical_models %}

## Generative Models for Biological Images

Data in scientific and commercial disciplines are increasingly characterized by high dimensions and relatively few samples. For such cases, apriori knowledge gleaned from experts and experimental evidence is invaluable for recovering meaningful models. Generative models are ideal for such knowledge-driven low-data settings. We are developing various generative models for biological imaging data and exploring novel applications of these models. We are also developing novel variational inference techniques that lead to the scalable and accurate inference, particularly for high-dimensional structured problems.

{% capture generative_models %}
**A generative modeling approach for interpreting population-level variability in brain structure**  
Ran Liu, Cem Subakan, Aishwarya H. Balwani, Jennifer D. Whitesell, Julie A. Harris, Sanmi Koyejo, and Eva Dyer  
International Conference on Medical Image Computing and Computer Assisted Intervention (MICCAI), 2020  
[[preprint]](https://www.biorxiv.org/content/10.1101/2020.06.04.134635v1)

**Synthetic Power Analyses: Empirical Evaluation and Application to Cognitive Neuroimaging**  
Peiye Zhuang, Bliss Chapman, Ran Li, and Sanmi Koyejo  
Asilomar Conference on Signals, Systems, and Computers (Asilomar), 2019

**FMRI data augmentation via synthesis**  
Peiye Zhuang Alexander Schwing and Oluwasanmi Koyejo  
International Symposium on Biomedical Imaging (ISBI), 2019  
[[preprint]](https://arxiv.org/abs/1907.06134)

**Max-sliced wasserstein distance and its use for GANs**  
Ishan Deshpande, Yuan-Ting Hu, Ruoyu Sun, Ayis Pyrros, Sanmi Koyejo, Zhizhen Zhao, David Forsyth, and Alexander Schwing  
Conference on Computer Vision and Pattern Recognition (CVPR), 2019  
[[PDF]](http://openaccess.thecvf.com/content_CVPR_2019/papers/Deshpande_Max-Sliced_Wasserstein_Distance_and_Its_Use_for_GANs_CVPR_2019_paper.pdf)

**On prior distributions and approximate inference for structured variables**  
Oluwasanmi Koyejo, Rajiv Khanna, Joydeep Ghosh, and Russell A Poldrack  
Advances in Neural Information Processing Systems (NIPS) 27, 2014  
[[url]](http://papers.nips.cc/paper/5621-on-prior-distributions-and-approximate-inference-for-structured-variables)
{% endcapture %}

{% include yellow-box.html type="warning" content=generative_models %}

## Learning with Aggregated Data

Existing work in spatiotemporal data analysis often assumes that data are available as individual measurements. However, for reasons of privacy or storage, data is usually only available as aggregates. Data aggregation presents severe mathematical challenges to learning and inference, and a naive application of standard techniques is susceptible to the ecological fallacy. We have shown that aggregation has only a mild effect on model estimates in some cases. We are developing various tools for other cases that enable provably accurate predictive modeling with aggregated data while avoiding unnecessary and error-prone data reconstruction.

{% capture aggregated_data %}
**Aggregation for Sensitive Data**  
Avradeep Bhowmik, Joydeep Ghosh, and Oluwasanmi Koyejo  
13th International conference on Sampling Theory and Applications (SampTA), 2019  
[[url]](https://sampta2019.sciencesconf.org/267460/document)

**Frequency Domain Predictive Modeling with Aggregated Data**  
Avradeep Bhowmik, Joydeep Ghosh, Oluwasanmi Koyejo  
Proceedings of the 20th International conference on Artificial Intelligence and Statistics (AISTATS), 2017  
[[url]](http://proceedings.mlr.press/v54/bhowmik17a)

**Sparse parameter recovery from aggregated data**  
Avradeep Bhowmik, Joydeep Ghosh, and Oluwasanmi Koyejo  
International Conference on Machine Learning (ICML), 2016  
[[url]](http://www.jmlr.org/proceedings/papers/v48/bhowmik16.html)
{% endcapture %}

{% include yellow-box.html type="warning" content=aggregated_data %}

## Interpretable Machine Learning

As machine learning methods have become ubiquitous in human decision-making, their transparency and interpretability have become important. Interpretability is particularly important in domains where decisions can have significant consequences. Examples abound where interpretable models can reveal important but surprising patterns in the data that complex models obscure. We are currently studying exemplar-based interpretable modeling. This is motivated by studies of human reasoning, which suggest that using examples (prototypes) is fundamental to developing effective strategies for tactical decision-making. We are also exploring the application of structured sparsity and attention (with deep neural networks) to enable interpretability.

{% capture machine_learning %}
**Interpreting black box predictions using Fisher kernels**  
Rajiv Khanna, Been Kim, Joydeep Ghosh, and Oluwasanmi Koyejo  
International Conference on Artificial Intelligence and Statistics (AISTATS), 2019  
[[preprint]](https://arXiv.org/abs/1810.10118)

**Examples are not Enough, Learn to Criticize! Criticism for Interpretable Machine Learning**  
Been Kim*, Rajiv Khanna* and Oluwasanmi Koyejo\*  
Advances in Neural Information Processing Systems (NIPS) 29, 2016 (Oral)  
[[url]](https://papers.nips.cc/paper/6300-examples-are-not-enough-learn-to-criticize-criticism-for-interpretability) [[code]](https://github.com/BeenKim/MMD-critic)

**Sparse dependent Bayesian structure learning**  
Anqi Wu, Mijung Park, Oluwasanmi Koyejo, and Jonathan Pillow  
Advances in Neural Information Processing Systems (NIPS) 27, 2014  
[[url]](http://papers.nips.cc/paper/5233-sparse-bayesian-structure-learning-with-dependent-relevance-determination-priors)
{% endcapture %}

{% include yellow-box.html type="warning" content=machine_learning %}

**Funding**: We graciously acknowledge generous funding support from the [National Science Foundation](https://www.nsf.gov/){:target="\_blank"}, [National Institutes of Health](https://www.nih.gov/){:target="\_blank"}, [Google AI](https://ai.google/){:target="\_blank"}, [DARPA](https://www.darpa.mil/){:target="\_blank"}, [Jump ARCHES](https://jumpsimulation.org/research-innovation/research/jump-arches){:target="\_blank"}, [Discovery Partners Institute](https://dpi.uillinois.edu/){:target="\_blank"}, [Digital Transformation Institute](https://jumpsimulation.org/research-innovation/research/jump-arches){:target="\_blank"}, [CCBGM](https://ccbgm.illinois.edu/){:target="\_blank"}, [Onmilife](https://www.omnilife.ai/){:target="\_blank"}, and the [Mayo Clinic & Illinois Alliance](https://mayoillinois.org/){:target="\_blank"}. Our research is also supported by generous computing support from [Microsoft Azure](https://azure.microsoft.com/en-us/){:target="\_blank"}, [Intel AI](https://www.intel.ai/){:target="\_blank"}, [Amazon Web Services](https://aws.amazon.com/){:target="\_blank"}, [Google Cloud](https://cloud.google.com/){:target="\_blank"}, and [NCSA Bluewaters](https://bluewaters.ncsa.illinois.edu/){:target="\_blank"}. We have also received funding from the [Olga G. Nalbandov Lecture Fund](https://research.illinois.edu/olga-g-nalbandov-lecture-fund){:target="\_blank"}, the [MacArthur Foundation](https://www.macfound.org/){:target="\_blank"}, and the [Rockefeller Foundation](https://www.rockefellerfoundation.org/){:target="\_blank"} to support our outreach efforts.
