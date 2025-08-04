#' Warn for invalid n argument in rep
#'
#' @export
#'
#' @examples
#' # lints
#' lintr::lint(text = "rep('A', n = 10)", linters = rep_invalid_arg_linter())
rep_invalid_arg_linter <- lintr::make_linter_from_function_xpath(
  c("rep", "rep.int", "rep_len"),
  "following-sibling::SYMBOL_SUB[text() = 'n']",
  lint_message = "[review] n is not a valid argument for rep()."
)
# FIXME: eventually, this could be replaced by a linter to check named argument
# existence for all base functions
