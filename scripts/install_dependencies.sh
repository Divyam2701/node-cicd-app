#!/bin/bash
set -e  # Stops script if any command fails
set -x  # Prints each command before running it

echo "Running Install Dependencies script..."
exec > /tmp/install_dependencies.log 2>&1  # Redirects output to a log file

# Install necessary dependencies
sudo yum update -y || true  # Avoid breaking due to failed updates
sudo yum install -y nodejs npm || sudo apt install -y nodejs npm || true

echo "Dependencies installation completed!"
