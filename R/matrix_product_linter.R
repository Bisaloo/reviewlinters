#' Matrix product can perform fast operations without `apply()`
#'
#' @export
#'
#' @examples
#' # lints
#' lintr::lint(
#'   text = "apply(m, 1, function(x) sum(x * y))",
#'   linters = matrix_product_linter()
#' )
#'
matrix_product_linter <- lintr::make_linter_from_function_xpath(
  "apply",
  "following-sibling::expr[3][
    expr[expr[1]/SYMBOL_FUNCTION_CALL/text() = 'sum']/expr[2][
      OP-STAR
      and parent::expr/parent::expr/SYMBOL_FORMALS/text() = expr/SYMBOL/text()
    ]
  ]",
lint_message = "[review] this might be replaced by matrix product."
)
