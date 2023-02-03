
resource "docker_container" "nginx" {
  name  = "nginx"
  image = "nginx:latest"

  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_image" "nginx_image" {
  name = "nginx"
}