test_that("errors", {
  dat <- data.table(reference_allele = c("A", "T"), other_allele = c("T", "C"))
  expect_error(
  rmpalsnp(dat, 0.7)
  )
  expect_error(
    rmpalsnp(dat, -0.1)
  )
})

test_that("check_output", {
  dat <- data.table(reference_allele = c("A", "T", "G", "C", "T", "A", "G"), 
                    other_allele = c("C", "A", "G", "G", "C", "T", "C"), 
                    eaf = c(0.98, 0.56, 0.33, 0.71, 0.67, 0.49, 0.89), 
                    rs_number = c("rs111", "rs211", "rs311", "rs411", 
                                  "rs511", "rs611", "rs711" ))
  
  #test for A/T
  new_dat <- rmpalsnp(dat, 0.03)
  expect_equal(new_dat[, .N], 6)
  
  #test for T/A, A/T
  new_dat <- rmpalsnp(dat, 0.1) 
  expect_equal(new_dat[, .N], 5)
  
  #test for T/A, C/G, A/T
  new_dat <- rmpalsnp(dat, 0.21) 
  expect_equal(new_dat[, .N], 4)
  
  #test for T/A, C/G, A/T
  new_dat <- rmpalsnp(dat, 0.49) 
  expect_equal(new_dat[, .N], 3)
  
})
