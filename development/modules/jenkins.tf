resource "aws_security_group" "jenkins_sg" {
    vpc_id = var.vpc_id
    name = "jenkins_sg"
    description = "Allow inbound traffic to Jenkins server"
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  
}
      
     egress {
          from_port = 0
          to_port = 0
          protocol = "-1"
          cidr_blocks = ["0.0.0.0/0"]
          }

          tags = {
              Name = "jenkins_sg"
          }
}

resource "aws_instance" "jenkins" {
    //ami = "ami-00280090acd78f07f"
    ami = "ami-002c065c915689a19"
    instance_type = "t3.medium"
    key_name = "nov24"
    subnet_id = element(aws_subnet.public_subnet[*].id, 0)
    vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
    associate_public_ip_address = true


    tags = {
        Name = "jenkins_server"
    }

    root_block_device {
        volume_size = 50
        volume_type = "gp3" 
        delete_on_termination = true
    }
}
// Now we creating a Jenkins server in aws instance














# user_data = <<-EOF 
# #!/bin/bash
# sudo yum update -y
# sudo yum install java-1.8.0-openjdk -y
# sudo yum remove java-1.7.0-openjdk -y
# sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
# sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
# sudo yum install jenkins -y
# sudo systemctl start jenkins
# sudo systemctl enable jenkins
# EOF
# }