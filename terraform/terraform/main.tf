terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      Version = "~>3.27"
    }
  }

  required_version = ">=0.14.9"

    backend "s3" {
       bucket = "my-github-terraform-aws"
       key    = "state/terraform.tfstate"
       region = "us-west-2"
   }
}

provider "aws" {
  version = "~>3.0"
  region  = "us-west-2"
}

resource "aws_instance" "example_instance_ec2" {
    ami = "ami-07dfed28fcf95241c"
    instance_type = "t2.micro"
    
    tags = {
        Name = "ExampleInstanceEc2"
    }
}