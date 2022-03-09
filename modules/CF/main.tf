locals {
  s3_origin_id = "terjais582936"
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = var.s3_domain
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3_cloudfront.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Restrict Access to only CF"
  default_root_object = "index.html"

default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

   restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE", "IN"]
    }
  }

  tags = {
    Environment = "Dev"
  }

 aliases = ["terraformcloudfront.tk"]
  viewer_certificate {
//    acm_certificate_arn      = "arn:aws:acm:us-east-1:919350318206:certificate/101e2a7e-30c6-4c43-bd75-24e34c8d06f0"
      acm_certificate_arn      = "${var.acm_certificate}"
    minimum_protocol_version = "TLSv1"
    ssl_support_method       = "sni-only"
  }

}

resource "aws_cloudfront_origin_access_identity" "s3_cloudfront" {
  comment = "Restrict access to CF"
}
