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

After provisioning, the following web UIs will be available:
 - HDFS: http://192.168.56.10:9870
 - Yarn: http://192.168.56.10:8088
 - Hadoop Job History: http://192.168.56.10:19888
 - Spark Job History: http://192.168.56.10:18080

To shut down the local cluster, run `vagrant halt`. To delete all the
resources associated with the cluster, run `vagrant destroy`.

## Syncing files to local master node

By default, vagrant will sync the the project root (where the
Vagrantfile is located) to `/vagrant` within each cluster VM.

Additionally, a directory named `projects` will be
created in the project root directory and its contents will synced to
the directory `/projects` in the master node. You can place any code
and data that you want to access from within the master node in it,
and after you ssh into master via `vagrant ssh master`, you'll find
them in `/projects`.

Any items in the `projects` folder will be ignored by git.

This can be disabled by removing the relevant section in the
[Vagrantfile](Vagrantfile). Search for 'disable syncing'.

## Access URLs via hostnames

The local cluster will use hostnames configured internally for
communication amongst the nodes, and the jobs URLs may contain these
hostname. To access these URLs, one would have to replace the hostnames
with the related IP as configured in the [Vagrantfile](Vagrantfile).
For example replacing `master` in the URL with `192.168.56.10`.

However, you can configured your host machine to recognize these
URLs by updating the `/etc/hosts` file by adding the following lines
at the end.

```
# For use with data-playground cluster
192.168.56.10 master
192.168.56.11 worker1
192.168.56.12 worker2
```
