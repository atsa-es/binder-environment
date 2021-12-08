| Base Environment in JupyterLab | Base Environment in RStudio | atsa-labs in JupyterLab | atsa-labs in RStudio |
|:----------:|:---------:|:----------:|:---------:|
| [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/HEAD)  | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/HEAD?urlpath=rstudio) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fatsa-es%252Fatsa-labs%26urlpath%3Dlab%252Ftree%252Fatsa-labs%252FcleanedRmd%26branch%3Dmaster) | [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atsa-es/binder-environment/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fatsa-es%252Fatsa-labs%26urlpath%3Drstudio) |


This repo sets up a Binder environment for ATSA Labs eBook. Then `nbgitpuller` (a Python package) is used to pull in content from another repo into that environment. It takes forever to build the environment since R needs to be built so I don't want to have to rebuild everytime I change the content. So environment is in this repo and content is developed in other repos. The binder environment can be used to open content in any GitHub repo.

# Creating the link

You can use the environment to open files in any GitHub repo. The buttons above have the binder URL customized to open the atsa-labs repo. Use this tool to generate the link: https://jupyterhub.github.io/nbgitpuller/link to create links for other repos.

Basically your URL for your binder JupyterLab is going to look like this. The part after `git-pull` is the repo where to pull in the content and the part after `&urlpath=lab/tree/...` is saying what part of the repo to open at. In this case, open in the `cleanedRmd` folder.
```
https://mybinder.org/v2/gh/atsa-es/binder-environment/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252Fatsa-es%252Fatsa-labs%26urlpath%3Dlab%252Ftree%252Fatsa-labs%252FcleanedRmd%26branch%3Dmaster
```

------------

The rest of the readme describes what is in the repo.

# Set-up for your binder JupyterHub

`requirements.txt`, `postBuild` and `install.R` are what you need. The file in `labconfig` is to change the default behavior of the JupyterLab and is not required (but nice). In `requirements.txt` you set the R version and date. Basically this will use the [Microsoft R time machine](https://mran.microsoft.com/timemachine) to get R and associated packages for a certain date. That way you make sure that all the packages should work together. There might be some futzing to get a date and R versions that works well for you. Note that the RStudio version on Binder is old and might not work with the newest R versions.

# Making the Binder image

To make the binder image (which takes forever), I copy the URL of thie repo (binder-environment) and paste it into the box on [mybinder.org](https://mybinder.org/)

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

# Altering the default JupyterLab config

I want the default viewer for Rmd files in JupyterLab to be Notebook not Editor. I set this in the `labconfig` folder with a default override file. [See this for example](https://github.com/mwouts/jupytext/blob/main/binder/labconfig/default_setting_overrides.json)

# Various problems

* It didn't build when I tried to include `devtools` (in the Imports part of the DESCRIPTION file of atsalibrary) so I used `remotes`.
* The `repr` package had a bug that didn't allow help output (like `?lm`) in Jupyter notebooks. It was fixed Dec 2021 so I had to re-install repr in `install.R` to get the newer version.
* With nbgitpuller to get the content from another repo, it's a bit harder to get to the JupyterLab UI. You have to do some gymnastics with the URL you use. See above for how to get the URL.
* Why not use a Rocker pre-build docker image? Because MyBinder docs say don't do that and actually it was easier to customize without that and it is helpful to have all the standard Python packages.
