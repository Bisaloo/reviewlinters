test_that("false positives are skipped", {
  linter <- tolerance_linter()

  lintr::expect_no_lint("all.equal(x, round(x))", linter)
})

test_that("simple cases are disallowed", {
  linter <- tolerance_linter()

  lintr::expect_lint("all.equal(x, round(y))", ".", linter)
  lintr::expect_lint("all.equal(round(x), y)", ".", linter)
  lintr::expect_lint("all.equal(round(x), round(y))", ".", linter)
})
