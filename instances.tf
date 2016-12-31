resource "openstack_compute_instance_v2" "test" {
  # region provided by env variable
  name = "My Initial Server"
  image_id = "38f5dbf8-4e6f-465a-aba3-95538ea5cc99"               # Ubuntu 16.10 from `openstack image list`
  flavor_id = "550757b3-36c2-4027-b6fe-d70f45304b9c"              # vps-ssd-1 from `openstack flavor list`
  key_pair = "${openstack_compute_keypair_v2.test.name}"
  security_groups = ["${openstack_compute_secgroup_v2.ssh.name}"]

  provisioner "remote-exec" {
    script = "files/provision.sh"
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/Users/rhussmann/.ssh/id_rsa_ovh")}"
    }
  }
}

resource "openstack_compute_keypair_v2" "test" {
  # region provided by env variable
  name = "test"
  public_key = "${file("${path.module}/files/id_rsa_ovh.pub")}"
}

resource "openstack_compute_secgroup_v2" "ssh" {
  # region provided by env variable
  name = "ssh"
  description = "ssh access"
  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}
