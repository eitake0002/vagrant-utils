
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
