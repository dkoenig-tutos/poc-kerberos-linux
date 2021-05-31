#!/usr/bin/env bash

set -ex

echo '##########################################################################'
echo '############### Script de configuration du client NFS : nfs_client_setup.sh'
echo '##########################################################################'

yum install -y nfs-utils

mkdir -p /mnt/backups

clienthostname=$(hostname -f)
kadmin <<EOF
MotDePasse
addprinc -randkey nfs/$clienthostname
ktadd nfs/$clienthostname
quit
EOF

systemctl enable nfs-client.target
systemctl stop nfs-client.target
systemctl start nfs-client.target

echo 'nfs-storage.dkoenig.infra:/nfs/export_rw   /mnt/backups    nfs    soft,timeo=100,_netdev,rw,sec=krb5   0   0' >> /etc/fstab
mount -a

exit 0
