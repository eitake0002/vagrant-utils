
# Description:
#   Show vagrant version.
function check-version()
{
  vagrant -v
}

# Description:
#   Show help.
function show-help()
{
  vagrant -h
}

# Description:
#   Show subcommand(box) help.
function show-box-help()
{
  vagrant box -h
}

# Description:
#  Add box
function add-box()
{
  box_url=$1
  vagrant box add ${box_url}
}

# Description:
#   Show box list.
function show-box-list()
{
  vagrant box list
}

# Description.
#   SSH Connection.
function ssh-connect()
{
  vagrant ssh
}

# Description:
#   Check status.
function check-status()
{
  vagrant status
}

# Description:
#   Halt Virtual Machine.
function halt-vm()
{
  vagrant halt
}

# Description:
#   Destroy virtual machine.
function destroy-vm()
{
  vagrant destroy
}

# Description:
#   Export box.
# Usage:
#   export-box [<vm_hostname>]
# Example:
#   export-box
#   export-box dbvm
function export-box()
{
  box_hostname=$1
  if [ -z ${box_hostname} ]; then
    vagrant package
  else
    vagrant package ${box_hostname}
  fi
}

