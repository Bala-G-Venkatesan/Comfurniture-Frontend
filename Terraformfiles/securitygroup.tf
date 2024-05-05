resource "aws_security_group" "SG1" {
  #name = "nodesg"
  name_prefix = "workermanagement"
  vpc_id = module.vpc.vpc_id
}
resource "aws_security_group_rule" "Ingress" {
  security_group_id = aws_security_group.SG1.id
  from_port = 0
  to_port = 0
  type = "ingress"
  protocol = "-1"
  cidr_blocks = [ "10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16" ]
}
resource "aws_security_group_rule" "Egress" {
  security_group_id = aws_security_group.SG1.id
  from_port = 0
  to_port = 0
  type = "egress"
  protocol = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}