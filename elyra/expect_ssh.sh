#!/usr/bin/expect -f
spawn ssh-add /home/jovyan/.ssh/id_rsa
expect "Enter passphrase for /home/jovyan/.ssh/id_rsa:"
send "$env(SSH_PASSWORD)\n"
expect "Identity added: /home/ubuntu/.ssh/id_rsa (/home/jovyan/.ssh/id_rsa)"
exit

