#! /bin/bash

# setting hardening config and varibels 

DOMIN=votingabs.com
SSH_PORT=1245
BACKUP_DIR=/opt/backup/file_$NOW

if [-z $BACKUP_DIR ];then
  echo "Already exsist"
esle 
  mkdir -p $BACKUP_DIR
fi 

apt update && upgarde -y

apt install curl vim fail2ban


# dsiable and mask ufw
systemctl stop ufw 
systemctl disable ufw 
systemctl mask ufw 


cp /etc/fail2ban/fail2ban.conf /etc/fail2nab.local
sed -i 's/ssh port/ ssh port=''$SSH_PORT/g' /etc/fail2ban.local

systemctl restart fail2ban 
systemctl enable fail2ban 
fail2ban-client status 
