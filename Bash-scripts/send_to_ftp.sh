#!/bin/bash

# Backing up docker volume
sudo tar czf /home/ftp/pgsql-backup.tar -C /var/lib/docker/volumes/some-volume/_data/ . && echo "DV Backuped..."

# Changing ownership to non-root user
sudo chown user:user /home/ftp/pgsql-backup.tar && echo "Chown complete..."

# Connecting to FTP and setting SSL connection without verifying cert
sudo lftp -u ${FTP_USER},${FTP_PASS} ${FTP_IP} << EOF
set ftp:ssl-protect-data true
set ftp:ssl-force true
set ssl:verify-certificate no

cd PGSQL_Backup
put /home/ftp/pgsql-backup.tar

bye
EOF

echo "Status - SUCCESS"
