# debian-lan
copy of: https://salsa.debian.org/andi/debian-lan-ansible

# Call 
```
#!/bin/bash
ansible-playbook -c=local --inventory=localhost, ../debian-lan/installbox.yml  --extra-vars "hostname=installbox domain=test.local"
```
# Problems
* ansible start in debian installer does not work.
* ansible start after boot (cron @reboot) also make sone problems. Still working on a solution.

### Later




