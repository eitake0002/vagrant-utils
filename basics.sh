
# Description:
#   Init vagrant.
#   $ vagrant init [box_name] [box_url]
# Usage:
#   vagrant-init <box_hostname> <box_url>
# Example:
#   vagrant-init mybox https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
function vagrant-init()
{
  box_hostname=$1
  box_url=$2
  
  if [ -z ${box_hostname} ] || [ ${box_url} ]; then
    echo "Argument is not correct!" >&2
    return 1;
  fi
  
  vagrant init ${box_hostname} ${box_url}
}

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
#   Execute command inside vm directly.
# Usage:
#   ssh-command-exec-directly
function ssh-command-exec-directly()
{
  com=$1
  vagrant ssh -c "${com}"
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
#   Reload virtual machine.
#   Same as halt and up manually.
function reload-vm()
{
  vagrant reload
}

# Description:
#   Export box. After exporting, you can add box like below.
#   $ vagrant box add new_box
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
