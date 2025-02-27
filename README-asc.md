# debian-lan
copy of: https://salsa.debian.org/andi/debian-lan-ansible

# Call 
```
#!/bin/bash
ansible-playbook -c=local --inventory=localhost, ../debian-lan/installbox.yml  --extra-vars "hostname=installbox domain=test.local"
```
# Problems
* ansible start in debian installer does not work.

### Later

### Idea 
* xxxbox is a computer to install. It is mostly a host for the infrastruktur
* xxxhost is also a computer to install. It is a host for uns as standalone also outside this network
* xxxadd is a funktion like gnome testmenu that will be added to the current installation.
* dist-upgrade2testing.yml is also a playbook for changing a host.

### Make a normal install from this

```
sudo adduser ekf # normal user no control over the system.

sudo adduser ekf --ingroup sudo # to be in charge of the system
```
give him a password.
```
sudo make-auto-login-console -d # disable auto login.
```
You can still login with ssh and key from the install server .... 

### Some Ideas to manage password of install users.
```
sudo passwd -l $USER # deaktiviert password. Mit -u kann wieder aktiviert werden. 

sudo passwd -d $USER # clean password.
passwd # new password if it is clean.

sudo passwd $USER # new password for user.

sudo passwd root # new password for the root user.
```
