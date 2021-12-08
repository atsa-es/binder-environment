# This will get all the needed packages
install.packages("remotes")
remotes::install_github("atsa-es/atsalibrary", dependencies = c("Depends", "Imports"))
# This fixes a bug that didn't allow help to be shown in Jupyter notebooks
remotes::install_github("IRkernel/repr")
