test_that("in_linter catches unnecessary OR chains", {
  linter <- in_linter()

  lintr::expect_lint(
    "x == 'a' | x == 'b'",
    ".",
    linter
  )

  # Works with short-circuit operator
  lintr::expect_lint(
    "x == 'a' || x == 'b'",
    ".",
    linter
  )

  # Works with yoda tests
  lintr::expect_lint(
    "'a' == x || 'b' == x",
    ".",
    linter
  )

  # Works with 'semi-yoda' tests
  lintr::expect_lint(
    "x == 'a' || 'b' == x",
    ".",
    linter
  )

  # Works with longer chains
  lintr::expect_lint(
    "x == 'a' | x == 'b' | x == 'c'",
    ".",
    linter
  )
})

test_that("common in_linter negative cases", {
  linter <- in_linter()

  lintr::expect_no_lint(
    "x == 'a' | y == 'b'",
    linter
  )

  lintr::expect_no_lint(
    "x == 'a' || y == 'b'",
    linter
  )
})
