
resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc-cidr}"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = {
        name = "sed vpc"
    }
}


resource "aws_internet_gateway" "intenet_gateway" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        name = "sed igw"
    }
}

resource "aws_subnet" "public-subnet-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.public-subnet-1-cidr}"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true  
    tags = {
        name = "public subnet 1"
    }
}

resource "aws_subnet" "public-subnet-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.public-subnet-2-cidr}"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true  
    tags = {
        name = "public subnet 2"
    }
}

resource "aws_route_table" "public-route-table" {
    vpc_id = aws_vpc.vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.intenet_gateway.id
    }
    tags = {
        name = "public route table"
    }
}

resource "aws_route_table_association" "public-subnet-1-route-table-association" {
    subnet_id = aws_subnet.public-subnet-1.id
    route_table_id =  aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-2-route-table-association" {
    subnet_id = aws_subnet.public-subnet-2.id
    route_table_id =  aws_route_table.public-route-table.id
}


resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.private-subnet-1-cidr}"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false
    tags = {
        name = "Private subnet 1"
    }
}


resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "${var.private-subnet-2-cidr}"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false
    tags = {
        name = "Private subnet 2"
    }
}





