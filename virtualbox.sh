
# Description:
#   Check virtualbox version.
function check-vbox-version()
{
  VBoxManage -v
}

# List virtual machines.
function list-vms()
{
  vboxmanage list vms
}
