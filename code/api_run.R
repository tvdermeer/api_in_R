library(plumber)


setwd("~/code")
api_testing <- plumber::plumb("api_setup.R")
api_testing$run(host = '127.0.0.1', port=8000)