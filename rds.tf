# Launching RDS db instance
resource "aws_db_instance" "wp_dataBase" {
  allocated_storage    = 20
  max_allocated_storage = 50
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.22"
  instance_class       = "db.t2.micro"
  name                 = "wp"
  username             = "wp-admin"
  password             = "q3q3q3"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.SG_private_subnet_.id]
  skip_final_snapshot = true 

provisioner "local-exec" {
  command = "echo ${aws_db_instance.DataBase.endpoint} > DB_host.txt"
    }

}
