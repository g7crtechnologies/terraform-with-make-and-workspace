#!/bin/bash

sudo yum install -y python3

# Set the content variable
content=$(cat <<END
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

    # Create mount point directory if it doesnt exist
    subprocess.run(f"sudo mkdir -p {mount_point}", shell=True)

    # Mount partition
    subprocess.run(f"sudo mount /dev/{partition} {mount_point}", shell=True)

    # Add to fstab to mount at boot
    blkid = subprocess.check_output(f"sudo blkid -s UUID -o value /dev/{partition}", shell=True).decode().strip()
    with subprocess.Popen(['sudo', 'tee', '-a', '/etc/fstab'], stdin=subprocess.PIPE) as f:
        f.stdin.write(f"UUID={blkid} {mount_point} ext4 defaults,nofail 0 2\n".encode('utf-8'))
END
)

# Write the content variable to the file
sudo echo "$content" > "/home/azureadmin/datadisk.py"

# Set the file permissions
sudo chmod +x "/home/azureadmin/datadisk.py"

echo "datadisk.py file created successfully."

sudo python3 "/home/azureadmin/datadisk.py"
