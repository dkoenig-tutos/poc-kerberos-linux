#!/usr/bin/env bash

set -ex

echo '##########################################################################'
echo '##### Script de configuration d'un client Kerberos : setup-kerberos-client.sh'
echo '##########################################################################'

yum install -y krb5-workstation pam_krb5

cp /etc/krb5.conf /etc/krb5.conf-orig

sed -i '/default_realm/c\ default_realm = DKOENIG.INFRA' /etc/krb5.conf
sed -i 's/# EXAMPLE.COM/  DKOENIG.INFRA/g' /etc/krb5.conf
sed -i 's/#  kdc = kerberos.example.com/   kdc = kdc.dkoenig.infra/g' /etc/krb5.conf
sed -i 's/#  admin_server = kerberos.example.com/   admin_server = kdc.dkoenig.infra/g' /etc/krb5.conf
sed -i 's/# }/}/g' /etc/krb5.conf
sed -i 's/# .example.com = EXAMPLE.COM/ .dkoenig.infra = DKOENIG.INFRA/g' /etc/krb5.conf
sed -i 's/# example.com = EXAMPLE.COM/ dkoenig.infra = DKOENIG.INFRA/g' /etc/krb5.conf

clienthostname=$(hostname -f)
kadmin <<EOF
MotDePasse
addprinc -randkey host/$clienthostname
ktadd host/$clienthostname
quit
EOF

exit 0
