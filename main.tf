terraform {

required_version = "~>1.3.0"

required_providers {

aws = {

source = "hashicorp/aws"

version = "~>3.0"

}

}

}
terraform {
required_version = "~>1.3.0" 
required_providers {
 
source = "hashicorp/aws"
 version = "~>3.0"
region = "ap-south-1"

profile = "default"
 }
}
