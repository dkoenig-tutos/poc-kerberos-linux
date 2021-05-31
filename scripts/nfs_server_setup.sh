#!/usr/bin/env bash

set -ex

echo '##########################################################################'
echo '##### Script de configuration serveur NFS : nfs_server_setup.sh'
echo '##########################################################################'


# setsebool -P nfs_export_all_rw 1
# setsebool -P nfs_export_all_ro 1
# getsebool -a | grep nfs_export

# systemctl start firewalld
# systemctl enable firewalld
# firewall-cmd --permanent --add-service=nfs
# firewall-cmd --permanent --add-service=mountd
# firewall-cmd --permanent --add-service=rpc-bind
# systemctl restart firewalld

yum install -y nfs-utils

#mkdir -p /nfs/export_ro
mkdir -p /nfs/export_rw
chown nfsnobody:nobody /nfs/export_rw
chmod 775 /nfs/export_rw

# semanage fcontext -a -t public_content_rw_t  "/nfs/export_rw(/.*)?"
# restorecon -Rv /nfs/export_rw

clienthostname=$(hostname -f)
kadmin <<EOF
MotDePasse
addprinc -randkey nfs/$clienthostname
ktadd nfs/$clienthostname
quit
EOF

# Faire 'man exports' pour voir des exemples de configurations 
#echo '/nfs/export_ro  *(sync)' > /etc/exports
echo '/nfs/export_rw  *(rw,no_root_squash,sec=krb5)' >> /etc/exports

systemctl start nfs-server
systemctl enable nfs-server

# Il est possible de confirmer le bon fonctionnement avec les commandes suivantes :
# showmount -e localhost
# et :
# cat /var/lib/nfs/etab

exit 0
