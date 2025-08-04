#' Use nlevels where appropriate
#'
#' @export
#'
#' @examples
#' # lint
#' lintr::lint(text = 'length(levels(x))', linters = nlevels_linter())
nlevels_linter <- lintr::make_linter_from_function_xpath(
  "levels",
  "parent::expr/preceding-sibling::expr[1]/SYMBOL_FUNCTION_CALL[text() = 'length']",
  lint_message = "[review] Replace length(levels(x)) by nlevels(x)."
)
