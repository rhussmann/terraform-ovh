provider "openstack" {
  # user_name, tenant_name, password, auth_url
  # provided by env variables
}

output "instance" {
  value = "${openstack_compute_instance_v2.test.access_ip_v4}"
}
