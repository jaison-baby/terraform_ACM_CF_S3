variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  default        = "terjais582936"
}
variable "AWS_REGION" {
    default = "us-east-2"
}
variable "instance_accesskey" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = ""
}
variable "instance_secretkey" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {
                   Terraform   = "true"
                    Environment = "dev"
  }
}
variable "domain" {
 default = "terraformcloudfront.tk"
}

