####### vpc ########

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

########## subnet ##########

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet"
  }
}


##### ec2 instance #######

resource "aws_instance" "web" {
  ami           = "ami-0bb4c991fa89d4b9b"
  instance_type = "t3.micro"
 subnet_id = data.aws_subnet.selected
  tags = {
    Name = "HelloWorld"
  }
}
