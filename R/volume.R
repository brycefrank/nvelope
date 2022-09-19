

format_volumes <- function(vol_out) {

}

# Just a temporary file to sketch a few things out.

#' Get the volume of a set of trees.
#'
#' @param voleq
#' @param region
#' @param forest
#' @param district
#' @param spcd
#' @param dia
#' @param ht
#' @param vol_type A string or character vector specifying the volume types to
#' return. Volume types are given in the pre-loaded dataset ``.
get_volume <- function(voleq, region, forest, district, spcd, dia, ht,
  vol_type='cvts', mtopp=0, mtops=0, ht1prd=0, ht2prd=0, upsht1=1, upsd1=0,
  stump=1, fclass=0, dbtbh=0, btr=0) {
  n <- length(voleq)
  result <- c()
  errflag <- 0
  vol <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

  for(i in 1:n) {
    voleq_i  <- voleq[[i]]
    region_i <- region[[i]]
    forest_i <- forest[[i]]
    district_i <- district[[i]]
    spcd_i <- spcd[[i]]
    dia_i <- dia[[i]]
    ht_i <- ht[[i]]

    result_i <- suppressWarnings(.Fortran("vollib_r",
      as.character(voleq_i),
      as.integer(region_i),
      as.character(forest_i),
      as.character(district_i),
      as.integer(spcd_i),
      as.double(dia_i),
      as.double(ht_i),
      as.double(mtopp),
      as.double(mtops),
      as.double(ht1prd),
      as.double(ht2prd),
      as.double(upsht1),
      as.double(upsd1),
      as.double(stump),
      as.integer(fclass),
      as.double(dbtbh),
      as.double(btr),
      as.double(vol),
      as.integer(errflag)
    ))

    result <- c(result, result_i[[18]][[1]])
  }

  result
}


