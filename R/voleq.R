#' Retrieve a default volume equation number.
#'
#' This function returns a string representing the default volume equation
#' number for the specified region, forest, district and species combination.
#'
#' @param region A number or numeric vector representing the USFS regions to
#' query.
#' @param forest A number or numeric vector representing the USFS forests to
#' query.
#' @param district A number or numeric vector representing the USFS districts to
#' query.
#' @param spcd A number or numeric vector representing the species code to
#' query.
#' @return A string representing the queried equation.
#' @export
get_voleq <- function(region, forest, district, spcd) {
  # TODO make a validation function that all vectors are the same length
  n <- validate_numeric_args(region)
  result <- c()

  for(i in 1:n) {
    region_i <- region[[i]]
    forest_i <- forest[[i]]
    district_i <- district[[i]]
    spcd_i <- spcd[[i]]

    voleq_container <- '          '
    errflag <- 0

    result_i <- suppressWarnings(.Fortran(
      'getvoleq_r',
      as.integer(region_i),
      as.character(forest_i),
      as.character(district_i),
      as.integer(spcd_i),
      as.character(voleq_container),
      as.integer(errflag)
    ))

    result <- c(result, result_i[[5]])
  }

  result
}