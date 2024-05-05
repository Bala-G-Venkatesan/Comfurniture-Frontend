resource "aws_s3_bucket" "s3_backend" {
  bucket = "remote-backend-comfurniture"
}
resource "aws_dynamodb_table" "dynamo_backend" {
  name = "remote-backend-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
