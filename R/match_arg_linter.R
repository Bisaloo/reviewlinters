#' match.arg automatically detect choices if used on a function argument
#'
#' @export
#'
#' @examples
#' lintr::lint(text = "match.arg(x, c('a', 'b'))", linters = match_arg_linter())
#'
match_arg_linter <- lintr::make_linter_from_function_xpath(
  "match.arg",
  "following-sibling::expr[2][expr/SYMBOL_FUNCTION_CALL/text() = 'c']",
  lint_message = "match.arg can automatically infer choices for function arguments."
)
