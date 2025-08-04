test_that("false positives are skipped", {
  linter <- matrix_product_linter()

  lintr::expect_no_lint(
    "apply(m, 1, function(x) y * z)",
    linter
  )

  lintr::expect_no_lint(
    "apply(m, 1, function(x) x*y)",
    linter
  )
})

test_that("simple cases are disallowed", {
  linter <- matrix_product_linter()

  lintr::expect_lint(
    "apply(m, 1, function(x) sum(x*y))",
    ".",
    linter
  )
  lintr::expect_lint(
    "apply(m, 2, function(a) sum(a*b))",
    ".",
    linter
  )
})
