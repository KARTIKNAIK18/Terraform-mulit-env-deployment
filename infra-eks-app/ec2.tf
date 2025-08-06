
#region



# key pair 
resource "aws_key_pair" "my_key_pair_new" {
    key_name= "${var.env}-infra-app-key"
    public_key = file("teraa-key.pub")

    tags= {
        Name = "${var.env}-infra-app-key",
        Environment = var.env
    }
  
}

# VPC 

resource "aws_default_vpc" "default" {
    tags = {
        Name = "default-vpc"

    }
  
}


resource "aws_security_group" "my-security" {
    name = "${var.env}infra-app-sg"
    description = "Security group for EC2 instances"
    vpc_id = aws_default_vpc.default.id # interpolation 

    ingress{
        from_port = 22
        to_port =  22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH access from anywhere"
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "allow HTTP access from anywhere"
    }

    ingress{
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
    tags = {
      name = "${var.env}infra-app-sg"
    }
    

}

resource "aws_instance" "my-instanc" {
    count = var.instance_count
    key_name = aws_key_pair.my_key_pair_new.key_name
    security_groups = [aws_security_group.my-security.name]
    instance_type = var.instance_type
    ami = var.ec2_ami_id


    root_block_device {
        volume_size = var.env == "dev" ? 9 : 10 
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "${var.env}-infra-app-instace"
        Environment = var.env

    } 
}


