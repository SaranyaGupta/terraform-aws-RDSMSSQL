create_db_option_group          	        = true
create_db_subnet_group    			= true
create_db_parameter_group 			= true
create_db_instance        			= true
create_cloudwatch_log_group			= true
create_high_cpu_alarm           	        = true
create_memory_too_low_alarm			= true
create_storage_space_too_low_alarm	        = true
##Cloudwatch alarm name prefix format --> <cwa>-<rds>-<rds engine>-<App_Name>-<Environment>##
name                                            = "cwa-rds-mssql-test"
##RDS identifier format --> <rds>-<App_Name>-<rds engine>-<Environment>-<Numeric>##
identifier                			="rds-mssql-test"
engine                   			="sqlserver-se"
engine_version            			="16.00"
instance_class           			="db.m5.large"
allocated_storage         			= 20
storage_type              			="gp2"
license_model             			="license-included"
username                 			="testuserdb"                        
security_group_ids        			=["sg-0c5426001fd0fb679"]
network_type             			="IPV4"
availability_zone         			="us-east-2a"
multi_az                  			=false
ca_cert_identifier        			="rds-ca-2019"
maintenance_window        			="Mon:00:00-Mon:03:00"
snapshot_identifier       			="test"
skip_final_snapshot     			=true
backup_retention_period   			=14
backup_window            			="09:46-10:16"
max_allocated_storage     			=40
create_monitoring_role    			=true
enabled_cloudwatch_logs_exports		        =["error"]
cloudwatch_log_group_retention_in_days          =7
deletion_protection       			=true
character_set_name       			="Latin1_General_CI_AS"
db_instance_tags          			= {
ApplicationOwner= "abc@gmail.com",
BusinessOwner="abc@gmail.com",
CostCenterDept="IS Infrastructure",
Environment="Test",
Product="xyz",
Role="Database",
ServiceCriticality="High",
SupportContact="Support@gmail.com"
}
##SUBNET GROUP NAME format --> <rds-sg>_<App_Name>_<rds engine>_<Environment>_<Version>_<Numeric>##
db_subnet_group_name        		="rdsmssql-subnet"
db_subnet_group_description 		= "test db rds mssql subnet group"
subnet_ids                  		=["subnet-0b86a94123ccf1094","subnet-04eff055558594bd7","subnet-0bbf1e60c1a0f1db1"]
tags                       	        = {resource = "rdsmssql"}
db_subnet_group_tags        		= {name="rdsmssql-subnet"}
db_option_group_tags        		= {name="rdsmssql-option-group"}
db_parameter_group_tags     		= {name="rdsmssql-parameter-group"}
##PARAMETER GROUP NAME format --> <rds-pg>_<App_Name>_<rds engine>_<Environment>_<Version>_<Numeric>##
parameter_group_name       	        = "rdsmssql-parameter-group"
parameter_group_description 		= "test db rds mssql parameter group"
family                      		= "sqlserver-se-16.0"
major_engine_version        		= "16.00"
##OPTION GROUP NAME format --> <rds-og>_<App_Name>_<rds engine>_<Environment>_<Version>_<Numeric>##
option_group_name          		= "rdsmssql-option-group"
option_group_description    		= "test db rds mssql option group" 
options                     		= [
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
  rds_sg3_mssql = {
    "rule1" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" },
    "rule2" = { type = "ingress", from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" },
    "rule3" = { type = "egress", from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" }
  }
  rds_sg4_mssql = {
    "rule1" = { type = "ingress", from_port = 22, to_port = 22, protocol = "tcp" , cidr_blocks = ["0.0.0.0/0"], description = "For SSH"}
  }
}
vpc_id             = "vpc-0419802ed12eec58a"
existing_sg_rules = {
sg-0c5426001fd0fb679 = {
"rule1" = { type = "ingress", from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" }
}
#,sg-0294c098f15df980e = {
#"rule1" = { type = "ingress", from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "For SSH" }
#}
}
ok_alarm            = ["arn:aws:sns:us-east-2:215691912540:RDSAlarm"]
actions_alarm       = ["arn:aws:sns:us-east-2:215691912540:RDSAlarm"]
monitoring_role_name = "rds-mssql-monitoring-role"

##optional variables. default values mentioned in variable.tf file##
/*
instance_use_identifier_prefix
custom_iam_instance_profile
storage_throughput
storage_encrypted
kms_key_id
replicate_source_db
replica_mode
iam_database_authentication_enabled
domain
domain_iam_role_name
skip_final_snapshot
final_snapshot_identifier_prefix
db_name
manage_master_user_password
master_user_secret_kms_key_id
port
vpc_security_group_ids
iops
publicly_accessible
monitoring_interval
monitoring_role_arn
monitoring_role_name
monitoring_role_use_name_prefix
monitoring_role_description
monitoring_role_permissions_boundary
allow_major_version_upgrade
auto_minor_version_upgrade
apply_immediately
blue_green_update
restore_to_point_in_time
s3_import
db_subnet_group_use_name_prefix
parameters
timezone
nchar_character_set_name
timeouts
option_group_timeouts
performance_insights_enabled
performance_insights_retention_period
performance_insights_kms_key_id
delete_automated_backups
cloudwatch_log_group_kms_key_id
db_instance_role_associations
CPU_threshold
Memory_threshold
storage_threshold
statistic
period
*/
