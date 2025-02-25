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

### Idea 
* xxxbox is a computer to install.
* xxxhost is also a computer to install
* xxxadd is a funktion like gnome testmenu that will be added to the current installation.
* dist-upgrade2testing.yml is also a playbook for changing a host.

