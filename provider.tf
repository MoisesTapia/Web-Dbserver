# Create a DBServer and ouput the private IP
# Create a Web Server and ensure it has fixed Public IP
# Create a Security Group for the web server openening ports 80 and 443 HTTPS
# Run the provider Scrip on Web Server


provider "aws" {
    region  = var.region
}