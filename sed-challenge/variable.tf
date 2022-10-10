variable "vpc-cidr" {
    default = "10.0.0.0/16"
    description = "VPC Cidr Block"
    type = string
    }
     
variable "public-subnet-1-cidr" {
    default = "10.0.0.0/24"
    description = "public-subnet-1 Cidr Block"
    type = string
    }
    
    
    variable "public-subnet-2-cidr" {
    default = "10.0.1.0/24"
    description = "public-subnet-2 Cidr Block"
    type = string
    }
    
    
    variable "private-subnet-1-cidr" {
    default = "10.0.2.0/24"
    description = "private-subnet-1 Cidr Block"
    type = string
    }
    
     
    variable "private-subnet-2-cidr" {
    default = "10.0.3.0/24"
    description = "private-subnet-2 Cidr Block"
    type = string
    }
    
   variable "domain_name" {
       default = "sedchallenge123.com"
       description = "route 53 domain_name"
       type = string
       
   }
    
    
    