variable "domain" {
  description = "Name of the s3 bucket. Must be unique."
  default        = "terraformcloudfront.tk"
}
variable "domain_name" {
  description = "new CF dns"
}
variable "zone_id" {
  description = "new CF zone"
}

variable "AWS_REGION" {
    default = "us-east-1"
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

