#!/bin/bash

# Get project name from the user
read -p "Enter the project name: " projectName

# Replace spaces with '-' and convert to lowercase
projectNameSlug=$(echo "$projectName" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')

# Create project directory
mkdir $projectNameSlug
cd $projectNameSlug

# Create Golang source file
echo "package main

import \"fmt\"

func main() {
    fmt.Println(\"Hello, $projectName!\")
}" > main.go

# Create go.mod file
echo "module $projectNameSlug

go 1.16
" > go.mod

# Create Dockerfile
echo "FROM golang:latest

WORKDIR /app
COPY . .

RUN go build -o main .

CMD [\"./main\"]" > Dockerfile

# Print instructions
echo -e "\nProject '$projectName' created successfully!"
echo -e "\nFollow these instructions to build and run the project using Docker:"
echo -e "\n1. cd $projectNameSlug"
echo -e "2. docker build -t $projectNameSlug ."
echo -e "3. docker run $projectNameSlug"

# Additional distribution instructions
echo -e "\nDistribution Instructions:"
echo -e "To distribute the Docker image, push it to a container registry such as Docker Hub."
echo -e "1. docker login (if not already logged in)"
echo -e "2. docker tag $projectNameSlug:latest your-docker-username/$projectNameSlug:latest"
echo -e "3. docker push your-docker-username/$projectNameSlug:latest"

