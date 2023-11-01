# This is a Generated main.tf from tf-docker-template.sh

module "docker" {
    source = "./docker"

    dockerfile_path =  "../"
    container_name = "nginx"
    container_port = 80
    container_exposed_port = 8080
}