#!/bin/bash

# https://www.reddit.com/r/linux4noobs/comments/1gv7yza/im_on_ubuntu_24041_lts_and_my_ntfs_hdd_wont_mount/
# https://stackoverflow.com/questions/24793069/what-does-do-in-bash

set -e

BACKUP_FOLDER="/mnt/backup"
PARTITION_NAME="/dev/nvme0n1p4"

# check if running as root
if [[ $EUID -ne 0 ]]; then
   	echo "Error: This script must be run as root" >&2
   	exit 1
fi

# check that the disk is not already mounted
if [[ -e $BACKUP_FOLDER ]]; then
	echo "$BACKUP_FOLDER already exists" >&2
	exit 1
fi

# mount backup ntfs partition
mkdir $BACKUP_FOLDER
mount -t $PARTITION_NAME $BACKUP_FOLDER

