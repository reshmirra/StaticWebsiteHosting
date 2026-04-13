locals {
  s3_object_acl = "public-read"
}

resource "aws_s3_bucket" "website_bkt" {
  bucket = var.bucketname

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website_bkt.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website_bkt.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_versioning" "site" {
  bucket = aws_s3_bucket.website_bkt.id
  versioning_configuration {
    status = "Enabled"
  }
}  
resource "aws_s3_bucket_acl" "website_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.website,
    aws_s3_bucket_public_access_block.website,
  ]
  bucket = aws_s3_bucket.website_bkt.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  depends_on = [aws_s3_bucket_acl.website_acl]
  bucket = aws_s3_bucket.website_bkt.id
  key    = "index.html"
  source = "index.html"
  acl    = local.s3_object_acl
  content_type = "text/html"
}
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.website_bkt.id
  key    = "error.html"
  source = "error.html"
  acl    = local.s3_object_acl
  content_type = "text/html"
}
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bkt.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  } 
  depends_on = [ aws_s3_bucket_acl.website_acl ]
}