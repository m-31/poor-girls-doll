![poor girl's doll](http://merlinpuppetry.gr/wp-content/uploads/2013/05/DGT4.jpg)
# Poor Girl's Doll

You have root access to some linux boxes and want to add some ssh keys,
install some packages and change their config files.

You want to extend your deployment continuously so your deployment must
be idempotent.

You want an agent less deployment and are even to lazy to write
an ansible playbook?

Just put your deployment in a simple bash script calling some functions
that assure that a certain state is reached.


**Be warned: this is not meant for production usage!**

But for rapidly building a setup script for some simply equipped VMs just
to test something these simple shell functions might be useful.


## Examples

### Example 1
Execute "example_1.sh" which uses bash functions from pgd.sh on host "my.host.com"

    ./execute example_1.sh my.host.com

This will update the yum repositories, install and configure ntp and install
an additional root key on your centos or rhel host.

### Example 2
You want to add some rules to your /etc/sudoers file on various hosts?

    ./execute example_2.sh my.host.com

