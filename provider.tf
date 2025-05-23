terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }

        random = {
            source = "hashicorp/random"
            version = "~> 3.0"
        }
    }
    
    required_version = ">= 1.0.0"
}

provider "aws" {
    region = "us-east-1"
}

resource "random_id" "bucket_suffix" {
    byte_length = 6
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-unique-bucket-name-${random_id.bucket_suffix.hex}"
}

output "bucket_name" {
    value = aws_s3_bucket.my_bucket.id
}