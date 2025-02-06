# debian-lan
copy of: https://salsa.debian.org/andi/debian-lan-ansible

# Call 
```
#!/bin/bash
ansible-playbook -c=local --inventory=localhost, ../debian-lan/installbox.yml  --extra-vars "hostname=installbox domain=test.local"
```
# Problems
must generate a ssh key for ansible 

must add the 194.168.0.22 host to /etc/hostfile!

becaus I must make modification :-( in:
```
roles/prepare4clients/task/main.yml 
```
Still search for the problem.
