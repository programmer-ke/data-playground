# ansible-data-playground
Set up a cluster of debian servers with hadoop and spark

# Local cluster

To set up a cluster in your dev machine, install [vagrant][1] and
[ansible][2]

[1]: https://www.vagrantup.com/docs/installation
[2]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Then in the project root, run `vagrant up`.

This should download and install everything in your local cluster.
Afterwards, to repeat the
process without having removed all resources via `vagrant destroy`,
you will need to include the provisioning flag i.e.
`vagrant up --provision`.

# done
- Can run `vagrant up` to bring up a 3 node cluster
  - use ansible version 2.10 (debian 11 default)

# todo
- Check that apt packages are up to date
- Install hadoop dependencies
