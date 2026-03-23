provider "local" {}

variable "filename" {
  default = "test.txt"
}

variable "message" {
  default = "Test message"
}

resource "local_file" "file" {
  filename = var.filename
  content  = var.message
}