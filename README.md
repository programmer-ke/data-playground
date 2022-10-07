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

Additionally, you can create a directory called `workspace` inside the
project root that will synced to `/workspace` in the master node. Git
has been set to ignore contents of this directory so you can place
data and code that you do not want to track as part of this repository
in it. You will find these files in `/workspace` inside the master
node.

