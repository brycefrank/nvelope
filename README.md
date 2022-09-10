`nvelope` is a no-fuss R wrapper for the National Volume Estimator Library (NVEL).
The NVEL itself is maintained by the United States Forest Service (USFS) and can
be accessed directly [here](https://www.fs.usda.gov/forestmanagement/products/measurement/volume/nvel/index.php).

The objective of `nvelope` is to create a user friendly interface for interacting
with the NVEL in the R programming environment. The NVEL itself already provides 
R access, but direct Fortran calls must be written by the user. `nvelope` simplifies
these calls with convenient wrapper functions, and tree-level volumes and biomass 
predictions for large amounts of tree records can be made with just a few lines of code.

# Quick Start

A typical use-case of `nvelope` is given in this section. First, the user retrieves the
volume equation numbers using `get_voleq` for every species in a dataset. Then, these 
equation numbers are merged to a tree list containing diameters and heights, and cubic
foot volumes are retrieved using `get_volume`. We utilize `dplyr` package functions, 
however this is not required to utilize `nvelope`.

**Example Data**

Consider a dataframe that specifies the USFS region, forest, district and species codes
for some data of interest referred to as `spcd_data`.

```{r}
library(nvelope)
library(dplyr)

spcd_data <- data.frame(
  region = c(6, 6, 6),
  forest = c('01', '01', '01'),
  district = c('01', '01', '01'),
  spcd = c(122, 202, 242)
)
```

This dataframe contains all the necessary information used to retrieve volume equation 
numbers for each species using `get_voleq`. 

**Obtaining Volume Equation Numbers**

We obtain

```{r}
spcd_data %>% mutate(voleq = get_voleq(region, forest, district, spcd))
```

and the result

```{r}
  region forest district spcd      voleq
1      6     01       01  122 I11FW2W122
2      6     01       01  202 I11FW2W202
3      6     01       01  242 616BEHW242
```

# Installation
