# data-playground
Set up a cluster of debian servers with hadoop and spark

# Local cluster setup

To set up a cluster in your dev machine, install [vagrant][1] and
[ansible][2]

[1]: https://www.vagrantup.com/docs/installation
[2]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Then in the project root, run `vagrant up`.

This should download and install everything in your local cluster if
this is the first time.

Afterwards, you can run `vagrant up` to start up the cluster. If you
want to repeat the setting up process you will need to include the
provisioning flag i.e.  `vagrant up --provision`, or run
`vagrant provision` after the cluster is up.

To shut down the local cluster, run `vagrant halt`. To delete all the
resources associated with the cluster, run `vagrant destroy`.
