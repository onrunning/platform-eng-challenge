resource "aws_db_instance" "blog1-staging" {
  identifier = "blog1-staging"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  name = "blog1"
  allocated_storage = 10
  username = "foo"
  password = "123456789"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true

  tags = {
    "stage"         = "staging"
    "managed_by"    = "terraform"
    "project"       = "blog1"
    "team"          = "team1"
  }
}
