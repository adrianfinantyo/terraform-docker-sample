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
