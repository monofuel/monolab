terraform {

  required_providers {
    namecheap = {
      source  = "robgmills/namecheap"
      version = "1.7.0"
    }
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.6.8"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.3"
    }
  }
  backend "s3" {
    bucket = "mono-terraform"
    key    = "monolab/tf.state"
    region = "us-west-1"
  }
}

# resource "aws_s3_bucket" "b" {
# 	bucket = "mono-terraform"
#  	acl    = "private"
# }


provider "aws" {
  profile = "default"
  region  = var.aws_region
}

provider "kubernetes" {
  alias       = "mk8s"
  config_path = "~/.kube/config"
}
