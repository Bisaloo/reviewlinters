#' Flag potential opportunities for `setequal()` use
#'
#' @details
#' Discussed in https://github.com/r-lib/lintr/issues/1763
#' 
#'
#' @export
#'
#' @examples
#' lintr::lint(text = 'identical(sort(x), sort(y))', linters = setequal_linter())
setequal_linter <- lintr::make_linter_from_function_xpath(
  "identical",
  glue::glue("following-sibling::expr/expr/SYMBOL_FUNCTION_CALL[{lintr:::xp_text_in_table(c('sort', 'unique'))}]"),
  lint_message = "[review] there might be an opportunity to use setequal()."
)