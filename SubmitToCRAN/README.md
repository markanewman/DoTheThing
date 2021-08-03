# Submit an R package to CRAN

**Updated**: 2021/08/03

The overall flow can be thought of as follows:

1. Build/test the package localy
2. Run alternitive tests
3. Submit it CRAN

The detailes steps are found below:

1. Clone the repo
2. Open [RStudio](https://www.rstudio.com) and run the below.
3. Load packages
```{r}
pkgs <- installed.packages()
pkg_name <- 'xxx'
pkg_path <- 'd:/repos/yyy/xxx'
pkg_pkg <- paste0('package:', pkg_name)
if (!('devtools' %in% pkgs)) { install.packages('devtools') }
if (!('roxygen2' %in% pkgs)) { install.packages('roxygen2') }
if (!('pkgdown' %in% pkgs)) { install.packages('pkgdown') }
if (pkg_name %in% pkgs) { remove.packages(pkg_name) }
```
4. Set working directory and clean files that will be regenerated.
   This folder will vary based on where the repo was cloned.
```{r}
setwd(pkg_path)
unlink(c('./man', './inst/doc', './NAMESPACE'), recursive = T)
```
5. Run the pre-build checks
```{r}
devtools::check(manual = T, vignettes = T)
detach(pos = which(search() == pkg_pkg), unload = T)
unlink(c('./man', './NAMESPACE'), recursive = T)
```
6. Make docs
```{r}
devtools::document()
devtools::build_vignettes()
dir.create('./inst/doc', showWarnings = F, recursive = T)
files <- list.files('./doc', pattern = 'html')
lapply(files, function(x) { file.rename(paste0('./doc/', x), paste0('./inst/doc/', x)) } )
unlink(c('./doc', './Meta'), recursive = T)
detach(pos = which(search() == pkg_pkg), unload = T)
```
7. Test the install-ability
```{r}
devtools::install_local(upgrade = 'never')
remove.packages(pkg_name)
```
8. Run the tests
```{r}
devtools::test()
```
9. Test using CRAN _like_ resources
```{r}
rhub::check_for_cran()
devtools::check_win_release()
```
