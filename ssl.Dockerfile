# Use Amazon Linux as the base image
FROM amazonlinux:latest

# Install OpenSSL
RUN yum install -y openssl

# Create a directory for the SSL certificate and key
RUN mkdir -p /ssl

# Generate a self-signed SSL certificate and private key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /ssl/private-key.pem \
  -out /ssl/public-certificate.pem \
  -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=example.com"