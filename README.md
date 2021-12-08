[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/HEAD)

# binder-environment

This sets up a Binder environment. This takes forever to build so I don't want to keep rebuilding everytime I change the content.

Content will be pulled in from other repos. Per this info
https://discourse.jupyter.org/t/tip-speed-up-binder-launches-by-pulling-github-content-in-a-binder-link-with-nbgitpuller/922

Read this on how to work with Rmd files in Jupyter Notebook
https://jupytext.readthedocs.io/en/latest/faq.html

* add `jupytext` to the `requirements.txt`
* add `jupyter lab build` to `postBuild`

To use, just double-click on an Rmd file and it'll open as a Jupyter notebook.
Demo it here https://mybinder.org/v2/gh/mwouts/nbrmd/main?filepath=demo Note this is python code not R but you'll get the idea.
