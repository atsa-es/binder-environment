JupyterLab: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/HEAD) 
RStudio: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/HEAD?urlpath=rstudio)

# binder-environment

This sets up a Binder environment. This takes forever to build so I don't want to keep rebuilding everytime I change the content.

# Set-up

Look at the files in this repo. That's what you need.

# Making the Binder image

Copy the URL of your GitHub repo and paste it into the box on [mybinder.org](https://mybinder.org/)

# Pulling in content from another repo

I have set this environment up so that you can pull in the contents from another repo into the created virtual environment. The binder image take **forever** to build so you don't want to be rebuilding that whenever you change the content. Also you can just use one image for lots of different content.

Content will be pulled in from other repos. Per this info
https://discourse.jupyter.org/t/tip-speed-up-binder-launches-by-pulling-github-content-in-a-binder-link-with-nbgitpuller/922

# Working with Rmd files in JupyterLab

Binder has the RStudio UI and JupyterLab. You can open your virtual environment in either. I kind of like the JupyterLab UI better for reading docs, rather than the RStudio UI, but that requires some extra steps so that you can open an Rmd as a Jupyter notebook. 

Read this on how to work with Rmd files in Jupyter Notebook
https://jupytext.readthedocs.io/en/latest/faq.html

* add `jupytext` to the `requirements.txt`
* add `jupyter lab build` to `postBuild`

To use, just double-click on an Rmd file and it'll open as a Jupyter notebook.
Demo it here https://mybinder.org/v2/gh/mwouts/nbrmd/main?filepath=demo Note this is python code not R but you'll get the idea.
