#!/bin/bash

info() {
  echo -n "install age"
}

run() {
  # check go is installed
  # check age is not installed (with specified version)
  
  go install filippo.io/age/cmd/...@v1.1.1
}
