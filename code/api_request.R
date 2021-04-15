library(httr)
library(jsonlite)
options(stringsAsFactors = FALSE)

url = 'http://127.0.0.1:8000'

path = 'multiply2'

body <- list(
  .data = "2"
)

raw.result <- POST(url = url, path = path, body = body, encode = 'json')

print(raw.result)
print(httr::content(raw.result))

