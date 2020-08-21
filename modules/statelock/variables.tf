########################################################
# Define variables for statelock module
########################################################

variable "s3_bucket_name" {
    type = string
    default = "anewbucketforterraformstatelock"
}

variable "dynamo_db_table_name" {
    type = string
    default = "anewddbforterraformstatelock"
}

variable "iam_user_name" {
    default = "cloud_user"
}