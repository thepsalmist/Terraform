terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

# resource "aws_instance" "my_first_server" {
#   ami           = "ami-0892d3c7ee96c0bf7"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "TestUbuntu"
#   }
# }

resource "aws_vpc" "my_test_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Test VPC"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.my_test_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet_1"
  }
}
