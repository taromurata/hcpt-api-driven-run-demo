terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_id" "server" {
  byte_length = 8
}

resource "random_string" "string1" {
  length = 16
  special = true
  override_special = "あいうえお具円"
}

output "server_id" {
  value = random_id.server.hex
}

output "string1" {
  value = random_string.string1.result
}
