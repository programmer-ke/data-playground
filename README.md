# data-playground
Set up a cluster of debian servers with hadoop and spark.

# Local cluster setup

To set up a cluster in your dev machine, install [vagrant][1] and
[ansible][2]

[1]: https://www.vagrantup.com/docs/installation
[2]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Then in the project root, run `vagrant up`.

This should download and install everything in a local 3-node cluster
if this is the first time.

Afterwards, you can run `vagrant up` to start up the cluster. If you
want to run through the setting up process you will need to include the
provisioning flag i.e.  `vagrant up --provision`, or run
`vagrant provision` after the cluster is up.

After the process is complete, you can SSH into master by using the
command `vagrant ssh master`. 

You can then run `start-dfs.sh` to start HDFS and `start-yarn.sh` to
start yarn.

Point your browser to http://192.168.30.30:9870 to see the HDFS web
interface, and http://192.168.30.30:8088 to see the yarn web
interface.

To shut down the local cluster, run `vagrant halt`. To delete all the
resources associated with the cluster, run `vagrant destroy`.

## Syncing files to local master node

By default, vagrant will sync the the project root (where the
Vagrantfile is located) to `/vagrant` within each cluster VM.

Additionally, a directory named `data-playground-projects` will be
created in your home directory and its contents will synced to the
directory `/projects` in the master node. You can place any code and
data that you want to access in the master node in it, and after you
ssh into master via `vagrant ssh master`, you'll find them in
`/projects`.

This can be disabled by removing the relevant section in the
[Vagrantfile](Vagrantfile). Search for 'disable syncing'.
