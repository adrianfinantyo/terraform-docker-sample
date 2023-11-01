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