### Todo

- [ ] Can format hdfs
- [ ] Can run hdfs
- [ ] Can run yarn

### In Progress

- [ ] Can configure hadoop

### Done

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
