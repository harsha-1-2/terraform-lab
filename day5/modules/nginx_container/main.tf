terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

variable "container_name" {}
variable "container_port" {}
variable "image_name" {}

resource "docker_container" "container" {
  name  = var.container_name
  image = var.image_name

  ports {
    internal = 80
    external = var.container_port
  }
}