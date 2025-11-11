import asyncdispatch, httpclient, json, strutils
const api = "https://support.temporaryemail.in"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "X-API-Key":"Fuckuiphone7890",
    "user-agent": "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.3",
    "Host": "support.temporaryemail.in",
    "Content-Type": "application/json",
    "accept": "application/json"
})

proc generate_email*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/generate-temp-mail")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_messages*(username:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/fetch-mails?username=" & username)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
