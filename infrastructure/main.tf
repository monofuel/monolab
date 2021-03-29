terraform {

  required_providers {
    namecheap = {
      source  = "Namecheap-Ecosystem/namecheap"
      version = "0.1.5"
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
