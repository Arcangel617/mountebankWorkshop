#!/bin/bash

curl -i -X POST -H 'Content-Type: application/json' http://localhost:2525/imposters --data '{
  "port": 4000,
  "protocol": "http",
  "stubs": [{
    "predicates": [{
      "equals": {
        "method": "GET",
        "path": "/hello"
      }
    }],
    "responses": [{
      "is": {
        "statusCode": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "body": {
          "message": "Hello world!"
        }
      }
    }]
  }]
}';