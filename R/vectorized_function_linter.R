#' Check for vectorized functions that might be used directly
#'
#' @export
#'
#' @examples
#' # lint
#' lintr::lint(
#'   text = 'vapply(x, iconv, to = "", sub = "ASCII")',
#'   linters = vectorized_function_linter()
#' )
#'
#' # okay
#' lintr::lint(
#'   text = 'iconv(x, to = "", sub = "ASCII")',
#'   linters = vectorized_function_linter()
#' )
vectorized_function_linter <- function() {
  # This list is incomplete and is populated as I discover new cases in my own
  # packages
  vectorized_fcts <- "iconv"

  xpath <- glue::glue(
    "following-sibling::expr[2]/SYMBOL[{lintr:::xp_text_in_table(vectorized_fcts)}]"
  )

  lintr::Linter(linter_level = "expression", function(source_expression) {
    xml <- source_expression$xml_parsed_content

    calls <- source_expression$xml_find_function_calls(c("sapply", "vapply"))

    bad_expr <- xml2::xml_find_all(calls, xpath)

    lintr::xml_nodes_to_lints(
      bad_expr,
      source_expression,
      lint_message = "[review] vapply might not be necessary here.",
      type = "warning"
    )
  })
}
