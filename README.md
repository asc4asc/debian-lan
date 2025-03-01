# debian-lan
copy of: https://salsa.debian.org/andi/debian-lan-ansible

Install a nativ debian bookworm with preseeding to have a optimal start for a ansible install with playbooks.

The installbox is a host to install clients with debian over the net. 

* install from a ansible host with ansible-playbook ......
* install from git from the net with ansible-pull ......
* instll local with ansible-playbook -i localhost -c local

-----------------------------------------------------------------------------------

# Example Calls 

after clone the git repro. git clone https://github.com/asc4asc/debian-lan.git
```
#!/bin/bash
ansible-playbook -c=local --inventory=localhost, debian-lan/add-testmenu.yml  # --extra-vars "hostname=demohost10 domain=test.local"
```

Direct from Net.
```
#!/bin/bash
ansible-playbook -c=local --inventory=localhost, add-testmenu.yml # --extra-vars "hostname=demohost11 domain=test.local"
```

On installbox (ansible host)
```
ansible-playbook --inventory=demohost12, debian-lan/add-testmenu.yml # --extra-vars "domain=test.local"
```

We will have examples in proxmox for testing with fixed Mac Adresses and auto install.


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
