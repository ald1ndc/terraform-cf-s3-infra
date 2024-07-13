data "aws_cloudfront_cache_policy" "example" {
  name = "Managed-CachingOptimized"
}

data "aws_iam_policy_document" "default" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [ "s3:GetObject",]
    resources = [
      "${aws_s3_bucket.static_web.arn}/*",
      ]
    condition {
      test      = "StringEquals"
      variable  = "AWS:SourceARN"
      values    = [] #Get ARN of your CLoudFront using Attibute
    }
  }
}
data "aws_acm_certificate" "name" {
  provider = aws.us-east-1 #Syntax: <provider>.<alias>
  domain   = "sctp-sandbox.com"
}

data "aws_route53_zone" "sctp_zone" {
  name = "sctp-sandbox.com"
}

