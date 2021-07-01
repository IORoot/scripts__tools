# V.
Vagrant wrapper,

This will run vagrant commands on boxes you specifiy. It greps for the ID within `vagrant global-status` and runs the command against that ID.

## Setup
Place all of your vagrant boxes into one parent folder and set the following environment variable in your .zshrc / .bashrc:

```
export VAGRANTPATH=/Users/USERNAME/vagrant
```
Change `/Users/USERNAME/vagrant` to wherever your vagrant folders are.
