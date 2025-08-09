#' Chained equality check linter
#'
#' Report the use of chained equality checks where `%in%` would be more
#' appropriate
#'
#' @examples
#' # lints
#' lintr::lint(
#'   text = "x == 'a' | x == 'b'",
#'   linters = in_linter()
#' )
#'
#' # This only makes sense in the case x if of length 1
#' lintr::lint(
#'   text = "x == 'a' || x == 'b'",
#'   linters = in_linter()
#' )
#'
#' # okay
#' lintr::lint(
#'   text = "x %in% c('a', 'b')",
#'   linters = in_linter()
#' )
#'
#' @export
in_linter <- lintr:::make_linter_from_xpath(
  xpath = "(//OR|//OR2)[
    preceding-sibling::expr[EQ]
    and following-sibling::expr[EQ]
    and preceding-sibling::expr/expr/SYMBOL/text() = following-sibling::expr/expr/SYMBOL/text()
  ]",
  lint_message = "Use %in% to test equality of a variable against multiple values."
)
