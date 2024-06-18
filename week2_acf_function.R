purely_rand_process = ts(rnorm(100))
print(purely_rand_process)
hist(purely_rand_process)
(acf(purely_rand_process, type='covariance'))