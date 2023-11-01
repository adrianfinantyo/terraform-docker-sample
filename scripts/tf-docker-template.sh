#!/bin/bash

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Initialize the root module
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

mkdir -p infrastructure/docker
cd infrastructure
touch main.tf outputs.tf

cat << EOF > main.tf
# This is a Generated main.tf from tf-docker-template.sh

module "docker" {
    source = "./docker"

    dockerfile_path =  "../"
    container_name = "YOUR_CONTAINER_NAME"
    container_port = YOUR_CONTAINER_PORT
    container_exposed_port = YOUR_CONTAINER_EXPOSED_PORT
}
EOF

cat << EOF > outputs.tf
# This is a Generated outputs.tf from tf-docker-template.sh

output "container_name" {
    value = module.docker.container_name
}

output "container_port" {
    value = module.docker.container_port
}

output "container_exposed_port" {
    value = module.docker.container_exposed_port
}

output "container_ip" {
    value = module.docker.container_ip
}

output "container_image" {
    value = module.docker.container_image
}

output "container_id" {
    value = module.docker.container_id
}
EOF

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Initialize the docker module
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

cd docker
touch main.tf providers.tf variables.tf outputs.tf

cat << EOF > main.tf
# This is a Generated main.tf from tf-docker-template.sh

terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}

resource "docker_image" "image" {
    name = format("%s-%s", "image", var.container_name)
    force_remove = true
    keep_locally = false
    build {
        context = var.dockerfile_path
        tag = [format("%s-%s", "image", var.container_name)]
    }
}

resource "docker_container" "container" {
    name = var.container_name
    image = docker_image.image.name
    ports {
        internal = var.container_port
        external = var.container_exposed_port
    }
}
EOF

cat << EOF > providers.tf
# This is a Generated providers.tf from tf-docker-template.sh

provider "docker" {
    host = "unix:///var/run/docker.sock"
}
EOF

cat << EOF > variables.tf
# This is a Generated variables.tf from tf-docker-template.sh

variable "dockerfile_path" {
    type = string
    description = "The path that directs to the Dockerfile"
}

variable "container_name" {
    type = string
    description = "The name of the container"
}

variable "container_port" {
    type = number
    description = "The port of the container"
}

variable "container_exposed_port" {
    type = number
    description = "The port of the host"
}
EOF

cat << EOF > outputs.tf
# This is a Generated outputs.tf from tf-docker-template.sh

output "container_ip" {
    value = docker_container.container.network_data.0.ip_address
}

output "container_port" {
    value = docker_container.container.ports[0].internal
}

output "container_exposed_port" {
    value = docker_container.container.ports[0].external
}

output "container_name" {
    value = docker_container.container.name
}

output "container_image" {
    value = docker_container.container.image
}

output "container_id" {
    value = docker_container.container.id
}
EOF