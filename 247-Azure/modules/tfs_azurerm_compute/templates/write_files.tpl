#cloud-config

packages:
  - python3

write_files:
  - path: /home/azureadmin/write_files.py
    permissions: '0777'
    content: |
      #!/usr/bin/env python
      import os

      # Define the list of files as dictionaries
      files = ${files}
      # Write the files to the file system
      for file_data in files:
        file_path = file_data["file_name"]
        file_content = file_data["file_content"]
        file_permissions = int(file_data["file_permissions"], 8) # convert octal string to integer
        with open(file_path, 'w') as f:
          f.write(file_content)
        os.chmod(file_path, file_permissions)

runcmd:
  - sudo yum install python3 -y
  - sudo python3 /home/azureadmin/write_files.py