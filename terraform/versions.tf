terraform {
  required_version = "~> 1.1"

  required_providers {
    esxi = {
      source = "josenk/esxi"
      version = "~> 1.10"
    }
  }
}
