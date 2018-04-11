# learn-salt

Sets up three VMs to run a salt master and two minions for an area to learn [SaltStack](https://saltstack.com/).

## Before You Begin
You must have [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) installed.

You will also need [vagrant-hostmanager](https://github.com/devopsgroup-io/vagrant-hostmanager) installed.
To install the plugin:
```
$ vagrant plugin install vagrant-hostmanager
```

## Running
To start the cluster, simply run
```
$ vagrant up
```

After starting up, connect your minions to the master
```
$ vagrant ssh master
$ sudo salt-key --accept-all
```

The VM is configured to use synced folders. 
On the master, `saltstack/salt` will map to `/srv/salt` and `saltstack/pillar` will map to `/srv/pillar`. 
This means that you can make changes locally using an editor of your choice and they will automatically 
be written on the salt master VM.
