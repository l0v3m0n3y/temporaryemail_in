# temporaryemail_in
api for temporaryemail.in free temp email service
# Example
```nim
import asyncdispatch, temporaryemail_in, json, strutils
let email = waitFor generate_email()
echo email["temp_email"].getStr()
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
