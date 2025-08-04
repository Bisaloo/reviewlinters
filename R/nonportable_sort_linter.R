#' `sort()` can produce locale-dependent outputs when used on character vectors
#'
#' @export
#'
#' @examples
#' # lints
#' lintr::lint(text = 'sort(x)', linters = nonportable_sort_linter())
#'
#' # okay
#' lintr::lint(text = 'sort(x, method = "radix")', linters = nonportable_sort_linter())
nonportable_sort_linter <- lintr::make_linter_from_function_xpath(
  "sort",
  "parent::expr[not(SYMBOL_SUB/text() = 'method')]",
  lint_message = "[review] sort() can produce locale-dependent outputs when used on character vectors"
)