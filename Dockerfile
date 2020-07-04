# Use the official GCC image to create a build artifact.
# This is an extremely simple, community contributed example of C. More complicated examples may require additional make files.
# https://hub.docker.com/_/gcc
FROM gcc:9.3 as builder

# Create and change to the app directory.
RUN mkdir /app
WORKDIR /app


# Copy local code to the container image.
COPY . ./

# Build the binary.
RUN gcc helloworld.c -o server

# Use the official Alpine image for a lean production container.
# https://hub.docker.com/_/alpine
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
#FROM alpine:3
#RUN apk add --no-cache ca-certificates
FROM gcc:9.3
RUN apt install ca-certificates

# Copy the binary to the production image from the builder stage.
COPY --from=builder /app/server /server

# Run the web service on container startup.
CMD ["/server"]
