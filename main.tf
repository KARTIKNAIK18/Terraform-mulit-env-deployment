module "dev-infra" {
    source = "./infra-eks-app"
    env = "dev"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-084a7d336e816906b"
    hash_key = "studentID"
    
}

module "stage-infra" {
    source = "./infra-eks-app"
    env = "stg"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-084a7d336e816906b"
    hash_key = "studentID"
    
}


module "prd-infra" {
    source = "./infra-eks-app"
    env = "prd"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-084a7d336e816906b"
    hash_key = "studentID"
    
}