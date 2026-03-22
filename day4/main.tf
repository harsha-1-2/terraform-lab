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

module "container1" {
  source         = "./modules/nginx_container"
  container_name = "web1"
  container_port = 8081
  image_name     = docker_image.nginx.image_id
}

module "container2" {
  source         = "./modules/nginx_container"
  container_name = "web2"
  container_port = 8082
  image_name     = docker_image.nginx.image_id
}