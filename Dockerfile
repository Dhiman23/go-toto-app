# Start from the official Go image
FROM golang:1.22.5-alpine3.20

# Set the working directory inside the container
WORKDIR /app

# Copy the Go modules and build files to the working directory
COPY go.mod .
COPY go.sum .
COPY main.go .
RUN go mod download

# Copy the entire source code to the working directory
COPY . .

# Build the Go application and name the output executable as 'dockergin'
RUN go build -o main .

# Ensure the 'dockergin' executable has the necessary permissions
RUN chmod +x main
# Expose the port that the application listens on
EXPOSE 8000

# Set the entry point to run the executable
ENTRYPOINT ["/app/main"]
