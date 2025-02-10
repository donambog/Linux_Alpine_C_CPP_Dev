# Linux Alpine C/C++ Development Environment

## Overview

This project sets up a C/C++ development environment on Alpine Linux using Docker. It includes necessary tools and configurations to streamline the development process. The environment is equipped with various development tools and configurations, including SSH key setup for pushing changes to GitHub.

## Features

- Alpine Linux as the base image
- Essential development tools installed
- Custom `.bashrc` configuration
- SSH key setup for GitHub integration
- Non-root user configuration
- Git configuration with user identity

## Setup

### Prerequisites

- Docker installed on your machine
- SSH keys generated for GitHub access(or either you can comment the ssh key part in the Dockerfile 
to avoid errors)

### Installation

1. **Clone the repository**:

   git clone git@github.com:donambog/Linux_Alpine_C_CPP_Dev.git
   cd Linux_Alpine_C_CPP_Dev

 2. Build The Docker Image
   docker build -t cpp-dev-alpine .
Run the Docker container:

3. RUN the DOCKER from your downloaded repository(mine Linux_Alpine_C_CPP_Dev)

docker run -it --rm -v "%cd%:/src" cpp-dev-alpine bash

4- Usage
All the tools packaged with Dockerfile are available for C++ compilation and buid
5- License
This project is licensed under the MIT License. See the LICENSE file for more details.

Note :
This `README.md` provides a comprehensive overview of the project, setup instructions, usage guidelines, and customization options. Let me know if there's anything specific you'd like to add or modify! 
