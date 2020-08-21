########################################################
# 
########################################################

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "us-east-1"
  version = "~> 2.36.0"
}


# Calling the statelock module/statelock
module "statelock" {
  source                      = "./modules/statelock"
  s3_bucket_name           = "anewbucketforterraformstatelock"
  dynamo_db_table_name        = "anewddbforterraformstatelock"
  iam_user_name               = "cloud_user"
  }


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
