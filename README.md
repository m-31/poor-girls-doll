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

But for rapidly building a setup script for some simply equiped VMs just
to test something these simple shell functions might be useful.


## Example

Execute "example.sh" (using bash functions from pgd.sh) on host "my.host.com"

    ./execute example.sh my.host.com

