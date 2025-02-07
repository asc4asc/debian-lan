# debian-lan
copy of: https://salsa.debian.org/andi/debian-lan-ansible

# Call 
```
#!/bin/bash
ansible-playbook -c=local --inventory=localhost, ../debian-lan/installbox.yml  --extra-vars "hostname=installbox domain=test.local"
```
# Problems

### Have disable firewall 
So I must generate eth1 interface by myself

Must make a mask and ipforward by myself

git.repro does not start as a service. Must start it in the shell
Also it run playbooks does not start because variable $playbook is not correct

On the client i must make a sudo file for the user ansible. To start ansible from server

