#' Validates correctness of numeric arguments supplied by user
#'
#' This internal function validates if all arguments provided by the user are
#' either (a) all numeric arguments of the same length or (b) all numeric
#' arguments of length one.
#'
#' @param ... A set of arguments to validate.
#' @return Errors if arguments cannot be validated, returns the length of the
#' arguments if they are valid.
validate_numeric_args <- function(...) {
  arguments <- list(...)
  length_first_vec <- length(arguments[[1]])
  arg_names <- unlist(lapply(substitute(list(...))[-1], deparse))

  for(i in 1:length(arguments)) {
    arg_i <- arguments[[i]]
    length_i <- length(arg_i)
    arg_name_i <- arg_names[[i]]

    if(!is.numeric(arg_i)) {
      stop(paste("Argument ", "'", arg_name_i, "'", " is not numeric.", sep=""))
    }

    print(length_i)
    print(length_first_vec)
    if(length_i != length_first_vec) {
      stop('Not all arguments are of the same length.')
    }
  }

  return(length_first_vec)
}