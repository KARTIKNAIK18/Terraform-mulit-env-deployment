variable "env" {
    description = "Environment for the EKS cluster"
    type = string
}

variable "bucket_name" {
    description = "this is the value for the bucket name"
    type = string
}


variable "instance_count" {
    description = "Number of EC2 instances to create"
    type = number
}

variable "instance_type" {
    description = "Type of EC2 instance to create"
    type = string
}


variable "ec2_ami_id" {
    description = "AMI ID for the EC2 instances"
    type = string
  
}


variable "hash_key" {
    description = "value for the hash key of the DynamoDB table"
    type = string
}