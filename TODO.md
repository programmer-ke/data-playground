### Todo

- [ ] provisioning on remote hosts
- [ ] Test spark in standalone mode vs yarn
- [ ] A script to install custom packages across the cluster


### In Progress



### Done
- [x] Set spark to run in standalone mode
  - fix work directory
	- 23/06/06 12:27:25 INFO Worker: Running Spark version 3.3.2
      23/06/06 12:27:25 INFO Worker: Spark home: /home/vagrant/spark
      23/06/06 12:27:25 ERROR Utils: Failed to create directory /home/vagrant/spark/work
      java.nio.file.AccessDeniedException: /home/vagrant/spark/work
- [x] Factor spark configs that are likely to be tweaked
- [x] Successfully run a spark-submit job in the cluster
- [x] Figure out starting services via ansible
  - using nohup seemed to help
- [x] Configure spark for the cluster
  - create hdfs logs directory (needs hdfs running)
    - https://www.linode.com/docs/guides/install-configure-run-spark-on-top-of-hadoop-yarn-cluster/#monitor-your-spark-applications
	- see: https://stackoverflow.com/a/32499389/1382495
- [x] Download and install spark binaries
- [x] A mapping from host directory to master node when using vagrant
  - Directory at $HOME/data-playground-project will be synced to master node VM
- [x] Can run yarn
- [x] Can run hdfs
- [x] Can format hdfs
- [x] Can configure hadoop
- [x] Can set up all the required environment variables
  - http://mywiki.wooledge.org/DotFiles
- [x] Fix first run check
	- dist-upgrade only runs if hdfs is not set up
- [x] `vagrant up --provision` should provision the VMs when all of
      them are running, instead of serially
- [x] Distribute the hadoop installation between nodes
      - https://dlcdn.apache.org/hadoop/common/
      - https://stackoverflow.com/q/25505146/1382495
	  - steps:
	    - download, verify and sync
	    - unarchive
- [x] Install hadoop dependencies
  - openjdk-11
- [x] Generate and distribute masters ssh pub key to workers
      - https://docs.ansible.com/ansible/latest/collections/community/crypto/openssh_keypair_module.html
      - https://docs.ansible.com/ansible/latest/collections/ansible/builtin/fetch_module.html
	  - https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html
- [x] Configure hostname and /etc/hosts for each server
- [x] Check that apt packages are up to date
  - Do a full upgrade on first run, and a safe upgrade otherwise
- [x] Use ansible insecure key for local ssh access
- [x] Can run `vagrant up` to bring up a 3 node cluster
  - use ansible version 2.10 (debian 11 default)
