terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))
}

module "containers" {
  source = "./modules/nginx_container"

  for_each = { for c in var.container_config : c.name => c }

  container_name = each.value.name
  container_port = each.value.port
  image_name     = docker_image.nginx.image_id
}
output "container_urls" {
  value = [for c in var.container_config : "http://localhost:${c.port}"]
}