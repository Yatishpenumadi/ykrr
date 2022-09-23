terraform {
required_version = "~>1.3.0"
required_providers {
aws = {
source = "hashicorp/aws"
version = "~>4.24.0"
}
}
}
 provider "aws"   {
  
region = "var.aws_region"

 
 
 }
resource "aws_s3_bucket" "storage-bucket" {
bucket = "my-s9-bucket"
tags = {
Name = "MY BUCKET"
Environment = "Dev"
}
}
resource "aws_s3_bucket_policy" "allow_access_from_public" {
bucket = aws_s3_bucket.storage-bucket.id
policy = data.aws_iam_policy_document.allow_access_from_public.json
}
data "aws_iam_policy_document" "allow_access_from_public" {
statement {
principals {
type = "AWS"
identifiers = ["*"]
}
actions = [
"s3:GetObject",
"s3:ListBucket",
]
resources = [
aws_s3_bucket.storage-bucket.arn,
"${aws_s3_bucket.storage-bucket.arn}/*",
]
}
}



