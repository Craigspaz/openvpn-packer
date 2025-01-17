source "amazon-ebs" "arm64" {
  ami_name                    = "openvpn-hvm-${local.timestamp}-arm64-ebs"
  ami_regions                 = var.ami_regions
  associate_public_ip_address = true
  encrypt_boot                = true
  instance_type               = "t4g.small"
  kms_key_id                  = var.build_region_kms
  launch_block_device_mappings {
    delete_on_termination = true
    device_name           = "/dev/xvda"
    encrypted             = true
    volume_size           = 8
    volume_type           = "gp3"
  }
  region             = var.build_region
  region_kms_key_ids = var.region_kms_keys
  skip_create_ami    = var.skip_create_ami
  source_ami         = data.amazon-ami.ubuntu_noble_arm64.id
  ssh_username       = "ubuntu"
  subnet_filter {
    filters = {
      "tag:Name" = "AMI Build"
    }
  }
  tags = {
    Application        = "OpenVPN"
    Architecture       = "arm64"
    Base_AMI_Name      = data.amazon-ami.ubuntu_noble_arm64.name
    GitHub_Release_URL = var.release_url
    OS_Version         = "Ubuntu Noble Numbat"
    Pre_Release        = var.is_prerelease
    Release            = var.release_tag
    Team               = "VM Fusion - Development"
  }
  # Many Linux distributions are now disallowing the use of RSA keys,
  # so it makes sense to use an ED25519 key instead.
  temporary_key_pair_type = "ed25519"
  vpc_filter {
    filters = {
      "tag:Name" = "AMI Build"
    }
  }
}
