#!/bin/bash

read -p "Enter the name of your Docker/Golang project: " project_name

# Replace spaces with hyphens and convert to lowercase
project_name_safe=$(echo "$project_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Color variables
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Create project directory
mkdir "$project_name_safe"
cd "$project_name_safe"

# Create src folder
mkdir src

# Create a simple Go source file
echo 'package main

import "fmt"

func main() {
    fmt.Println("Hello, Docker/Golang World!")
}' > src/main.go

# Initialize go module
go mod init "$project_name_safe"

# Create Dockerfile
echo "FROM golang:latest

WORKDIR /go/src
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

# Explicitly build the executable
RUN go build -o app ./src

CMD [\"./app\"]" > Dockerfile

# Create .github/workflows directory
mkdir -p .github/workflows

# Create GitHub Actions workflow file
echo "name: Build Docker Image

on:
  push:
  schedule:
    - cron: '0 0 * * *'

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Test Build Docker image
      run: docker build -t cgp-github-test ." > .github/workflows/main.yml

echo "${BLUE}Project created successfully in the '$project_name_safe' directory.${NC}"

# Instructions
echo "
${BLUE}To build and run the project using Docker:

1. Build the Docker image:
   docker build -t $project_name_safe .

2. Run the Docker container:
   docker run $project_name_safe

Note: If your project name contains spaces, replace them with hyphens in Docker commands.

GitHub Actions workflow is set up to build the Docker image on every commit and once every 24 hours. Check the status on the 'Actions' tab in your GitHub repository.${NC}"
