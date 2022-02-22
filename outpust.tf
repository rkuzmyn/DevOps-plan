
/*output "jenkins-master_id" {
  value = aws_instance.jenkins-master.id
}
*/

output "jenkins-master_public_ip_address" {
  value = aws_eip.my_static_ip.public_ip
}

/*output "jenkins_security_group" {
  value = aws_security_group.jenkins.id
}
*/
/*
output "data_aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}
*/
/*
output "data_aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}
/*
/*
output "data_aws_region_name" {
  value = data.aws_region.current.name
}
*/
/*
output "data_aws_region_description" {
  value = data.aws_region.current.description
}
*/