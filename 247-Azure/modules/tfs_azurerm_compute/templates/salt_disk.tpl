#cloud-config

# Mount disks
packages:
  - python3
write_files:
  - path: /mount_disks.py
    permissions: '0777'
    content: |
      #!/usr/bin/env python
      import subprocess
      import string

      # Create partition on each disk
      letters = string.ascii_lowercase[string.ascii_lowercase.index('c'):]
      disk_list = [f'sd{letter}' for letter in letters[:3]]  # Only first 3 disks
      mount_list = ${mount_list}

      for i, disk in enumerate(disk_list):
          partition = f"{disk}1"
          mount_point = mount_list[i]

          # Create partition
          subprocess.run(f"sudo parted -a optimal /dev/{disk} --script mklabel gpt mkpart primary ext4 0% 100%", shell=True)

          # Format partition with ext4
          subprocess.run(f"sudo mkfs.ext4 /dev/{partition}", shell=True)

          # Create mount point directory if it doesn't exist
          subprocess.run(f"sudo mkdir -p {mount_point}", shell=True)

          # Mount partition
          subprocess.run(f"sudo mount /dev/{partition} {mount_point}", shell=True)

          # Add to fstab to mount at boot
          blkid = subprocess.check_output(f"sudo blkid -s UUID -o value /dev/{partition}", shell=True).decode().strip()
          with subprocess.Popen(['sudo', 'tee', '-a', '/etc/fstab'], stdin=subprocess.PIPE) as f:
              f.stdin.write(f"UUID={blkid} {mount_point} ext4 defaults,nofail 0 2\n".encode('utf-8'))

  - owner: root:root
    path: ${config_dir}/install_salt_minion.sh
    content: |
      #!/bin/sh

      # install the salt minion
      sudo yum clean expire-cache
      sudo yum install salt-minion -y
      sudo systemctl enable salt-minion && sudo systemctl start salt-minion
      
      # Define the YAML content to replace /etc/salt/minion
      yaml_content='---
      config_dir: /etc/salt
      disable_modules:
      - swarm
      - boto3_elasticsearch
      log_level: warning
      master:
      - salt01.infra.shared.usw1.cloud.247-inc.net
      - salt01.infra.shared.east.cloud.247-inc.net
      - salt02.infra.shared.usw1.cloud.247-inc.net
      - salt02.infra.shared.east.cloud.247-inc.net
      master_tries: -1
      ping_interval: 10
      random_master: true
      random_startup_delay: 10
      recon_default: 5000
      ...'

      # Remove the existing content in /etc/salt/minion
      sudo echo "" > /etc/salt/minion

      # Add the YAML content to /etc/salt/minion
      sudo echo "$yaml_content" > /etc/salt/minion


      # Restart the salt minion
      sudo systemctl restart salt-minion

runcmd:
  - sudo yum install python3 -y
  - sudo python3 /mount_disks.py
  - /bin/bash ${config_dir}/install_salt_minion.sh
