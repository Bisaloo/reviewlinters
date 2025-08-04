#' Recommend use of lengths() == 0 to check for presence of NULLs in a list
#'
#' @details
#' Using `lengths(x) == 0` is not strictly equivalent to
#' `vapply(x, is.null, logical(1))`. The `lengths()` function returns 0 for
#' `NULL` values, empty lists, and zero-length vectors, while `is.null()` only
#' checks for `NULL`.
#' The change could introduce false positives if `x` contains empty but non-NULL
#' objects.
#'
#' @export
#'
#' @examples
#' # lint
#' lintr::lint(
#'   text = 'vapply(x, is.null, logical(1))',
#'   linters = lengths_zero_linter()
#' )
#'
#' lintr::lint(
#'   text = 'sapply(x, is.null)',
#'   linters = lengths_zero_linter()
#' )
#'
#' # okay
#' lintr::lint(
#'   text = 'lengths(x) == 0'
#' )
lengths_zero_linter <- lintr::make_linter_from_function_xpath(
  c("vapply", "sapply"),
  "following-sibling::expr[2]/SYMBOL[text() = 'is.null']",
  lint_message = "[review] This might be replaced by lengths == 0."
)