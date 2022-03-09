output "cloudfront_identity" {
 value = aws_cloudfront_origin_access_identity.s3_cloudfront.iam_arn
}

output "domain" {
 value = aws_cloudfront_distribution.s3_distribution.domain_name 
}

output "hosted_zone" {
 value = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
}

