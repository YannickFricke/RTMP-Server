# Use Debian as base image
FROM debian:10

# Update all the sources
RUN apt-get update

# Install the build essentials
RUN apt-get install -y build-essential

# Install nginx dependencies
RUN apt-get install -y libpcre3 libpcre3-dev libssl-dev zlib1g-dev

# Install git
RUN apt-get install -y git-core

# Install wget
RUN apt-get install -y wget

# Set the workdir to the usr src dir
WORKDIR /usr/local/src/

# Clone the rtmp module
RUN git clone https://github.com/arut/nginx-rtmp-module.git

# Fetch nginx source code
RUN wget http://nginx.org/download/nginx-1.17.2.tar.gz

# Unpack the nginx package
RUN tar xfvz nginx-1.17.2.tar.gz

# Setting the current working directory to the nginx package
WORKDIR /usr/local/src/nginx-1.17.2/

# Configure nginx
# With the following modules:
# - HTTP SSL module
# - NGINX RTMP module
RUN ./configure \
    --add-module=../nginx-rtmp-module \
    --with-http_ssl_module \
    --with-debug \
    --with-cc-opt="-Wimplicit-fallthrough=0" \
    --sbin-path=/usr/local/bin/nginx

# Build NGINX with 4 cores
RUN make -j4

# Install NGINX
RUN make install

# Mark the NGINX file as executable
RUN chmod +x /usr/local/nginx

# Copy the NGINX configuration to the container
COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf

# Add the NGINX path to existing path
ENV PATH /usr/local/nginx/sbin:$PATH

# Expose port 1935 for the RTMP server
EXPOSE 1935

# Expose the HTTP port
EXPOSE 8080

RUN mkdir -p /usr/local/nginx/logs/

# Set NGINX as command
CMD [ "/usr/local/bin/nginx" ]