variable "project_name" {
  description = "Name for all resources"
  type        = string
  default     = "epam-test"
}

variable "aws_profile" {
  description = "AWS profile from ~/.aws/credentials"
  type        = string
  default     = "vova"
}

variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "az_count" {
  description = "How many AZs to use (2 is enough for MVP)"
  type        = number
  default     = 2
}

variable "public_subnet_cidrs" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Owner       = "Vova R"
    Environment = "test"
    ManagedBy   = "Terraform"
  }
}
