resource "aws_instance" "web" {
  count = var.count
  ami             = var.ami
  instance_type   = var.instance_type
  associate_public_ip_address = "true"
  key_name = aws_key_pair.deployer.key_name
  security_groups = ["allow_tls"]
  user_data = file("userdata_file")
  lifecycle{
    prevent_destroy = false
  }
  tags = {
    Name = "HelloWorld${count.index +1}"
  }
}
resource "aws_instance" "imported" {
  ami             = "ami-00068cd7555f543d5"
  key_name        = aws_key_pair.deployer.key_name
  security_groups = ["allow_tls"]
  instance_type  = "t2.micro"
}
