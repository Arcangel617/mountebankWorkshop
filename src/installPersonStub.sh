#!/bin/bash

curl -i -X POST -H 'Content-Type: application/json' http://localhost:2525/imposters --data '{
  "port": 4001,
  "protocol": "http",
  "stubs": [{
    "predicates": [{
      "equals": {
        "method": "GET",
        "path": "/person"
      }
    }],
    "responses": [{
      "is": {
        "statusCode": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "body": {
          "data": [
            {"id" : "1", "name" : "Arcangel", "age": 30},
            {"id" : "2", "name" : "Andres", "age": 29}
          ]
        }
      }
    }]
  },
  {
    "predicates": [{
      "equals": {
        "method": "GET",
        "path": "/person/1"
      }
    }],
    "responses": [{
      "is": {
        "statusCode": 200,
        "headers": {
          "Content-Type": "application/json"
        },
        "body": {
          "data": [
            {"id" : "1", "name" : "Arcangel", "age": 30}
          ]
        }
      }
    }]
  },
  {
    "predicates": [{
      "equals": {
        "method": "GET",
        "path": "/person/2"
      }
    }],
    "responses": [{
      "is": {
        "statusCode": 400,
        "headers": {
          "Content-Type": "application/json"
        },
        "body": {
          "data": [
            {"error" : "Person not found"}
          ]
        }
      }
    }]
  }]
}'