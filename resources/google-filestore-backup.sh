#!/bin/bash

#install nfs-common

apt install nfs-common -y

apt install rsync -y

source /root/.bashrc


#backup filestore to GCS

DATE=$(date +"%m-%d-%Y-%T")

mkdir -p /mnt/$FILESHARE_MOUNT_PRIMARY
mount $FILESTORE_IP_PRIMARY:/$FILESHARE_NAME_PRIMARY /mnt/$FILESHARE_MOUNT_PRIMARY

gsutil rsync -r /mnt/$FILESHARE_MOUNT_PRIMARY/ gs://$GCP_BUCKET_NAME/$DATE/


#rsync filestore to secondary region

mkdir -p /mnt/$FILESHARE_MOUNT_SECONDARY
mount $FILESTORE_IP_SECONDARY:/$FILESHARE_NAME_SECONDARY /mnt/$FILESHARE_MOUNT_SECONDARY

rsync -avz /mnt/$FILESHARE_MOUNT_PRIMARY/ /mnt/$FILESHARE_MOUNT_SECONDARY/

#sleep for few minutes - for testing the script ## 

#sleep 300


#stop the VM

poweroff
