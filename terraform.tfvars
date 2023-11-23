identifier="rds-mssql-test"
engine="sqlserver-se"
engine_version="12.00"
instance_class="db.m5.large"
allocated_storage= 20
storage_type="gp2"
license_model="license-included"
username="testuser"                        
security_group_ids=["sg-0c5426001fd0fb679"]
network_type="IPV4"
availability_zone="us-east-2a"
multi_az=false
ca_cert_identifier="rds-ca-2019"
maintenance_window="Mon:00:00-Mon:03:00"
snapshot_identifier="test"
skip_final_snapshot=true
backup_retention_period=14
backup_window="09:46-10:16"
max_allocated_storage=40
create_monitoring_role=true
enabled_cloudwatch_logs_exports=["error"]
cloudwatch_log_group_retention_in_days=7
deletion_protection=true
character_set_name="Latin1_General_CI_AS"
db_instance_tags= {
ApplicationOwner= "abc@gmail.com",
BusinessOwner="abc@gmail.com",
CostCenterDept="IS Infrastructure",
Environment="Test",
Product="xyz",
Role="Database",
ServiceCriticality="High",
SupportContact="Support@gmail.com"
}
monitoring_role_name="mssql-monitoring-role"
db_subnet_group_name="rdsmssql-subnet"
db_subnet_group_description= "test db rds mssql subnet group"
subnet_ids=["subnet-0b86a94123ccf1094","subnet-04eff055558594bd7","subnet-0bbf1e60c1a0f1db1"]
tags = {resource = "rdsmssql"}
db_subnet_group_tags= {name="rdsmssql-subnet"}
db_option_group_tags= {name="rdsmssql-option-group"}
db_parameter_group_tags= {name="rdsmssql-parameter-group"}
parameter_group_name= "rdsmssql-parameter-group"
parameter_group_description= "test db rds mssql parameter group"
family= "sqlserver-se-12.0"
major_engine_version= "12.00"
option_group_name= "rdsmssql-option-group"
option_group_description= "test db rds mssql option group" 
/*
parameters = [{
     "name"  = "character_set_client"
     "value" = "utf8mb4"
      },
    {
      "name"  = "character_set_server"
      "value" = "utf8mb4"
    }]
*/
options = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
]
security_rules = {
  sg4 = {
    "rule1" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" },
    "rule2" = { type = "ingress", from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" },
    "rule3" = { type = "egress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" }
  }
  sg5 = {
    "rule1" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp" , cidr_blocks = ["0.0.0.0/0"], description = "For SSH"}
  }
}
vpc_id = "vpc-0419802ed12eec58a"
existing_sg_rules = {
sg-0c5426001fd0fb679 = {
"rule1" = { type = "ingress", from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" }
}
#,sg-0294c098f15df980e = {
#"rule1" = { type = "ingress", from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" }
#}
}
ok_alarm = ["arn:aws:sns:us-east-2:215691912540:RDSAlarm"]
actions_alarm = ["arn:aws:sns:us-east-2:215691912540:RDSAlarm"]
