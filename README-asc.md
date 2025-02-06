# debian-lan
copy of: https://salsa.debian.org/andi/debian-lan-ansible

# Aufruf 

#!/bin/bash
ansible-playbook -c=local --inventory=localhost, ../debian-lan/installbox.yml  --extra-vars "hostname=installbox domain=test.local"

# Problems

must make modification :-( in:
roles/prepare4clients/task/main.yml 

Still search for the problem.
