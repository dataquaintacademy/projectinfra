terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
}

provider "aws" {
	region = "us-east-1"
}

resource "aws_instance" "example" {
	count         = 20
	ami           = "ami-0c02fb55956c7d316"
	instance_type = "t2.micro"
	associate_public_ip_address = false

	tags = {
		Name = "server${count.index + 1}"
	}
}
