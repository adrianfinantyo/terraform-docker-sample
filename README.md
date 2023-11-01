# Terraform-Docker Sample

Welcome to the repository for managing Docker images and containers using Terraform. This repository is designed to help you manage and deploy Docker containers for local development and provides a foundation for future IaaS-based production deployments.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository serves as an Infrastructure as Code (IaC) solution for deploying Docker containers. It offers a structured and version-controlled approach for managing your Docker images and containers using Terraform. The setup includes:

1. Dockerfile for building custom Docker images.
2. Terraform configuration for defining container resources and local development environments.

## Prerequisites

Before getting started, make sure you have the following prerequisites installed on your local development machine:

- [Docker](https://www.docker.com/get-started)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Any additional tools or dependencies required for your specific projects.

## Getting Started

### For Your Reference

You can check out the available Terraform-Docker config in this repository as a reference for your own projects.

### Genereate Your Own Terraform-Docker Config

You can also generate your own Terraform-Docker config by using the script provided in this repository. To do so, follow these steps:

1. Run the `tf-docker-template.sh` script in your terminal or you can also run it without cloning the repository by using the following command:

   ```bash
   sh  -c "$(curl -fsSL https://raw.githubusercontent.com/adrianfinantyo/terraform-docker-sample/main/scripts/tf-docker-template.sh)"
   ```

2. Adjust the generated Terraform-Docker config to fit your project requirements.

## Usage

- Modify the Dockerfile(s) in the `docker/` directory to build your custom Docker images.
- Define your Docker container resources in the `main.tf` file using the `docker_container` resource.
- Use variables and modules as needed for project-specific configurations.
- Run `terraform apply` to create or manage your Docker containers.

**Note**: For production deployments, customize your Terraform configuration to work with your chosen IaaS provider (e.g., AWS, Azure, GCP) and set up remote state storage.

## Contributing

If you have any ideas or suggestions, feel free to open an issue or a pull request.🤝 I would be happy to hear your thoughts.

## License

This repository is open-source and available under the [MIT License](LICENSE).
