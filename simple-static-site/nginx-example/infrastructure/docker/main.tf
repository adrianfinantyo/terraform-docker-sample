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
