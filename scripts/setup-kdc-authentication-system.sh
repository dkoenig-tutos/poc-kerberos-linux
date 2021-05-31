#!/usr/bin/env bash

set -ex

echo '##########################################################################'
echo '##### Script de configuration du système d'authentification Kerberos : setup-kdc-authentication-system.sh'
echo '##########################################################################'

yum install -y krb5-server krb5-workstation pam_krb5

cp /var/kerberos/krb5kdc/kdc.conf /var/kerberos/krb5kdc/kdc.conf-orig

# systemctl start firewalld.service
# firewall-cmd --add-service=kerberos --permanent
# firewall-cmd --add-service=kadmin --permanent
# systemctl restart firewalld.service
# systemctl enable firewalld.service
# firewall-cmd --list-all

sed -i s/EXAMPLE.COM/DKOENIG.INFRA/g /var/kerberos/krb5kdc/kdc.conf

# make it only kerberos5 compatible and not backward compatible. 
sed -i s/#master_key_type/master_key_type/g /var/kerberos/krb5kdc/kdc.conf
sed -i '/master_key_type/a \ \ default_principal_flags = +preauth' /var/kerberos/krb5kdc/kdc.conf

cp /etc/krb5.conf /etc/krb5.conf-orig

sed -i '/default_realm/c\ default_realm = DKOENIG.INFRA' /etc/krb5.conf
sed -i 's/# EXAMPLE.COM/  DKOENIG.INFRA/g' /etc/krb5.conf
sed -i 's/#  kdc = kerberos.example.com/   kdc = kdc.dkoenig.infra/g' /etc/krb5.conf
sed -i 's/#  admin_server = kerberos.example.com/   admin_server = kdc.dkoenig.infra/g' /etc/krb5.conf
sed -i 's/# }/}/g' /etc/krb5.conf
sed -i 's/# .example.com = EXAMPLE.COM/ .dkoenig.infra = DKOENIG.INFRA/g' /etc/krb5.conf
sed -i 's/# example.com = EXAMPLE.COM/ dkoenig.infra = DKOENIG.INFRA/g' /etc/krb5.conf

cp /var/kerberos/krb5kdc/kadm5.acl /var/kerberos/krb5kdc/kadm5.acl-orig

sed -i 's/EXAMPLE.COM/DKOENIG.INFRA/g' /var/kerberos/krb5kdc/kadm5.acl

kdb5_util create -s -r DKOENIG.INFRA << EOF
MotDePasseSecret
MotDePasseSecret
EOF

systemctl enable krb5kdc
systemctl enable kadmin

systemctl start krb5kdc
systemctl start kadmin

kadmin.local <<EOF
addprinc root/admin
MotDePasse
MotDePasse
addprinc -randkey host/kdc.dkoenig.infra
ktadd host/kdc.dkoenig.infra
quit
EOF

# La commande ktadd ci-dessus doit créer le fichier suivant :
file /etc/krb5.keytab

exit 0
