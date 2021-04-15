
### from https://www.statworx.com/ch/blog/how-to-create-rest-apis-with-r-plumber/
### this is from an example where you send a number and a result is send back that is multiplied by 2
### The @post and @get comments enables the script to receive POST and GET requests.
### /multiply2 is for the path you want to enable the requests on

#* @filter cors
cors <- function(res) {
  res$setHeader("Access-Control-Allow-Origin", "*")
  plumber::forward()
}

## transform wide to long and long to wide format
#' @post /multiply2
#' @get /multiply2

function(req) {
  require(tidyr)
  require(dplyr)
  require(magrittr)
  require(httr)
  require(jsonlite)

  # get the post body that is send to the address
  body <- jsonlite::fromJSON(req$postBody)
  
  .data <- body$.data
  .trans <- body$.trans
  .key <- body$.key
  .value <- body$.value
  .select <- body$.select
  
  if(is.numeric(.data)) {
    return(.data * 2)
  }
  else if (is.na(.data)){
    print('Your request is empty, please send a number')
    req$status <- 400
  }
  else {
    print('Your request is not a number, please send a number.')
  }
  
}
