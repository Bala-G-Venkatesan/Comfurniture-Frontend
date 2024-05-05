terraform {
  backend "s3" {
    bucket = "remote-backend-comfurniture"
    key = "terraform/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "remote-backend-dynamodb"
  }
}