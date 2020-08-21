########################################################
# 
########################################################

# Require TF version to be same as or greater than 0.12.13
terraform {
  required_version = ">=0.12.13"
  backend "s3" {
   bucket         = "anewbucketforterraformstatelock"
   key            = "terraform.tfstate"
   region         = "us-east-1"
   dynamodb_table = "anewddbforterraformstatelock"
   encrypt        = true
  }
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.36.0"
}

/*
# Calling the statelock module/statelock
module "statelock" {
  source                      = "./modules/statelock"
  name_of_s3_bucket           = var.s3_bucket_name
  dynamo_db_table_name        = var.dynamo_db_table_name
  iam_user_name               = var.iam_user_name
  }
*/

resource "aws_vpc" "vpc" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  tags = {
    Name      = "Vpc"
    Terraform = "true"
  }
}
# Build route table 1
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "RouteTable1"
    Terraform = "true"
  }
}
# Build route table 2
resource "aws_route_table" "route_table2" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "RouteTable2"
    Terraform = "true"
  }
}
