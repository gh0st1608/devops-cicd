resource "aws_s3_bucket" "bucket" {
    bucket = "state-dev"
    lifecycle {
      prevent_destroy = false
  } 
    tags = {
      Name = "S3-django"
 }
}

/* resource "null_resource" "empty_bucket" {
  provisioner "local-exec" {
    command = "aws s3 rm s3://${aws_s3_bucket.my_bucket.bucket} --recursive"
  }

  depends_on = [aws_s3_bucket.bucket]
} */

resource "aws_s3_bucket_acl" "example_bucket_acl" {

    bucket = aws_s3_bucket.bucket.id
    acl    = "public-read"
    //acl = "private"

    depends_on = [
        aws_s3_bucket_ownership_controls.bucket_ownership_controls_serverless,
        aws_s3_bucket_public_access_block.bucket_public_access_block_serverless,
    ]
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls_serverless" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
    //object_ownership = "ObjectWriter"
  }

}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block_serverless" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false 
}
