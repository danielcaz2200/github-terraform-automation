terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

    backend "s3" {
       bucket = "my-github-terraform-aws"
       key    = "state/terraform.tfstate"
       region = "us-west-2"
      dynamodb_table = "terraform-state-locking"
      encrypt = true
   }
}

provider "aws" {
  region  = "us-west-2"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "example_instance_ec2" {
    ami = "ami-07dfed28fcf95241c"
    instance_type = "t2.micro"
    
    tags = {
        Name = "ExampleInstanceEc2"
    }
}