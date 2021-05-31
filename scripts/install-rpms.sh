#!/usr/bin/env bash

set -ex


echo '##########################################################################'
echo '##### Script initial et commun à toutes les machines : install-rpms.sh'
echo '##########################################################################'

yum install -y epel-release 
yum install -y vim
yum install -y bash-completion
yum install -y man-pages
yum install -y bash-completion-extras
yum install -y mtr



# Désactivation de SELINUX. 
sed -i 's/SELINUX=permissive/SELINUX=disabled/g' /etc/selinux/config
setenforce enforcing

# systemctl enable firewalld
# systemctl start firewalld

mandb

exit 0
