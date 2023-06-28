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

After provisioning, the HDFS web UI will be available at
http://192.168.56.10:9870

You can then SSH into the master node with `vagrant ssh master` and
start the various services as follows.

 - Yarn: `./hadoop/sbin/start-yarn.sh`. The web UI will be at
   http://192.168.56.10:8088
   
 - Hadoop Job History Server: `./hadoop/bin/mapred --daemon start historyserver`
   Web UI: http://192.168.56.10:19888

 - Spark in standalone mode: `./spark/sbin/start-all.sh`. Web UI: http://192.168.56.10:8080

 - Spark History Server: `./spark/sbin/start-history-server.sh`.
   Web UI: http://192.168.56.10:18080

Note that Spark is configured in standalone mode by default so it is
not dependent on Yarn. To make Spark run with Yarn as the resource
manager, change the value of `spark_master` in [vars.yml](vars.yml) to
`yarn` and shut down spark standalone if it is already running with
`./spark/sbin/stop-all.sh`.

To shut down the local cluster, run `vagrant halt`. To delete all the
resources associated with the cluster, run `vagrant destroy`.

## Syncing files to local master node

By default, vagrant will sync the the project root (where the
Vagrantfile is located) to `/vagrant` within each cluster VM.

Additionally, a directory named `projects` will be
created in the project's root directory and its contents will synced to
the directory `/projects` in the master node. You can place any code
and data that you want to access from within the master node in it,
and after you ssh into master via `vagrant ssh master`, you'll find
them in `/projects`.

Any files in the `projects` folder will be ignored by git.

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
