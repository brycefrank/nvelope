`nvelope` is a no-fuss R wrapper for the National Volume Estimator Library (NVEL).
The NVEL itself is maintained by the United States Forest Service (USFS) and can
be accessed directly [here](https://www.fs.usda.gov/forestmanagement/products/measurement/volume/nvel/index.php).

The objective of `nvelope` is to create a user friendly interface for interacting
with the NVEL in the R programming environment. The NVEL itself already provides 
R access, but direct Fortran calls must be written by the user. `nvelope` simplifies
these calls with convenient wrapper functions, and tree-level volumes and biomass 
predictions for large amounts of tree records can be made with just a few lines of code.

# Quick Start

```{r}
library(nvelope)

# Load sample trees
# todo specify a sample tree dataset

# Specify the volume equation number
voleq <- 'BEH32000dfaklsjd'

get_volume(voleq, region, forest, district, spcd, dbhob, httot)
```

# Installation
