#' Forbid the use of round() with all.equal() and expect_equal()
#'
#' @export
#'
#' @examples
#' # lints
#' lintr::lint(text = 'all.equal(round(x), y)', linters = tolerance_linter())
#'
#' lintr::lint(text = 'expect_equal(round(x), y)', linters = tolerance_linter())
#'
#' lintr::lint(text = 'expect_identical(round(x), y)', linters = tolerance_linter())
#'
#' # okay
#' lintr::lint(text = 'all.equal(x, y, tolerance = 1e-4)', linters = tolerance_linter())
tolerance_linter <- lintr::make_linter_from_function_xpath(
  c("all.equal", "expect_equal", "expect_identical"),
  "parent::expr[
    count(expr/expr/SYMBOL_FUNCTION_CALL[text() = 'round']) = 2
    or
    (
      count(expr/expr/SYMBOL_FUNCTION_CALL[text() = 'round']) = 1
      and expr/expr[SYMBOL_FUNCTION_CALL/text() = 'round']/following-sibling::expr[1]/SYMBOL/text() != expr/SYMBOL/text()
    )
  ]",
  # FIXME: can we determine the value of tolerance based the value of round(digits=)?
  lint_message = "[review] round() can be replaced by an appropriate value of tolerance"
)