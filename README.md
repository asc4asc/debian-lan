# debian-lan
Was started from a copy of: https://salsa.debian.org/andi/debian-lan-ansible / with great thanks to andi@debian.org

Install a nativ debian bookworm with preseeding to have a optimal start for a ansible install with playbooks.
We are installing only testhosts for debugging and testing. No production server!!!  

The installbox is a host to install clients with debian over the net. 

* Install with netboot debian pressed and the fresh client will be completed with ansible.
  * direkt version with start ansible in the chroot of the installer
  * Version that start ansible after reboot of the client better for debugging.....
* Install from a ansible host with ansible-playbook ...... (Need a ansible prepared host to start.) 
* Install from git from the net with ansible-pull ...... (Need a ansible prepared host to start.) 
* Install local with ansible-playbook -i localhost -c local (Need a ansible prepared host to start.) 

# Setup installbox
The installbox must be installed with two Interfaces the first is for boot over net.
After install we must change (in proxmox...) the first interface to dhcp for internet and the second is the new local net to install new clients.
You must install a other installbox 1 or 2 not the same as you are running because of IP doubles.

```disable proxy in /etc/apt/apt.conf```

-----------------------------------------------------------------------------------
# Finisch the Installation of Client
When you transfer the client into a other network ```disable proxy in /etc/apt/apt.conf``` 

# Gnome
dconf read /org/gnome/desktop/screensaver/idle-activation-enabled

dconf write /org/gnome/desktop/screensaver/idle-activation-enabled false

gsettings list-schemas 

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
ssh-keygen -R demohost12
ssh-keyscan demohost12 >> .ssh/known_hosts # prepare only in secure places.

ansible-playbook --inventory=demohost12, debian-lan/add-testmenu.yml # --extra-vars "domain=test.local"
```

We will have examples in proxmox for testing with fixed Mac Adresses and auto install.


# Problems
* ansible start in debian installer does only work with a workaround.
* the preseed file and the boot config files are difficult and so not so easy to set up for different needs. 

### Later

### Idea 
* xxxbox is a computer to install. It is mostly a host for the infrastructur
* xxxhost is also a computer to install. It is a host for uns as standalone also outside this network
* add-xxx is a function like gnome testmenu that will be added to the current installation.
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
sudo passwd -l $USER # deactivate password. With -u it can be activated again. 

sudo passwd -d $USER # clean password.
passwd # new password if it is clean.

sudo passwd $USER # new password for user.

sudo passwd root # new password for the root user.
```
