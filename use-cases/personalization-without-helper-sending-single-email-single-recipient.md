## Personalization (without helper) - Sending A Single Email to a Single Recipient

```go
package main

import (
  "fmt"
  "log"
  "os"

  "github.com/iktakahiro/sendgrid-go/v4"
)

func main() {
  request := sendgrid.GetRequest(os.Getenv("SENDGRID_API_KEY"), "/v3/mail/send", "https://api.sendgrid.com")
  request.Method = "POST"
  request.Body = []byte(`{
  "personalizations": [{
      "to": [{
          "email": "test1@example.com"
      }],
      "substitutions": {
          "%fname%": "recipient",
          "%CustomerID%": "CUSTOMER ID GOES HERE"
      },
      "subject": "YOUR SUBJECT LINE GOES HERE"
  }],
  "from": {
    "email": "test@example.com"
  },
  "content": [
      {
          "type": "text/html",
          "value": "<p> %fname% : %CustomerID% - Personalizations are awesome!</p>"
      }
  ]
  }`)
  response, err := sendgrid.API(request)
  if err != nil {
    log.Println(err)
  } else {
    fmt.Println(response.StatusCode)
    fmt.Println(response.Body)
    fmt.Println(response.Headers)
  }
}
```