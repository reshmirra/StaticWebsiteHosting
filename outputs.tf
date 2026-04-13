output "websiteendpoint" {
  value = aws_s3_bucket.website_bkt.website_endpoint
  description = "Endpoint URL for the static website hosted on S3"
  
}