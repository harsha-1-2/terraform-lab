provider "local" {}

variable "filename" {}
variable "message" {}

resource "local_file" "file" {
  filename = var.filename
  content  = var.message
}