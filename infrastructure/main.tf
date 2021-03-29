terraform {

  required_providers {
    namecheap = {
      source  = "robgmills/namecheap"
      version = "1.7.0"
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
