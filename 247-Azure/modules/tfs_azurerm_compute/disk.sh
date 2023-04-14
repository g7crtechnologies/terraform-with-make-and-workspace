#!/bin/bash

# Set variables
resource_group="tfs-rg-dev-eu-landingzone"
env="dev"
location_prefix="east"
component="switchboard"
location="eastus"
disk_sku="Standard_LRS"
disk_sizes=(100) # in GB
number_of_disks=${#disk_sizes[@]}
number_of_vms="2"
zones=("1" "2" "3")

# Create the disks
for ((j = 1; j <= number_of_vms; j++)); do
    for ((i = 1; i <= number_of_disks; i++)); do
        disk_name="tfs-datadisk-${env}-${location_prefix}-${component}-vm-${j}-disk-${i}"
        disk_size=${disk_sizes[$i - 1]}
        zone_index=$((j - 1))
        zone=${zones[$zone_index % ${#zones[@]}]}
        az disk create \
            --resource-group $resource_group \
            --name $disk_name \
            --location $location \
            --sku $disk_sku \
            --size-gb $disk_size \
            --zone $zone \
            --query "{id:id}" \
            --output tsv
    done
done

echo "Disks created successfully."
