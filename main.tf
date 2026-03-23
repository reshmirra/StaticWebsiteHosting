resource "aws_s3_bucket" "website_bkt" {
  bucket = "mystatic_website-{var.domain_name}"

  tags = var.tags
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website_bkt.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_s3_bucket_versioning" "site" {
  bucket = aws_s3_bucket.website_bkt.id
  versioning_configuration {
    status = "Enabled"
  }
}  