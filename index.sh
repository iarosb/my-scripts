#!/bin/bash

# Add scripts to be executed: 
declare -a scripts=
(
  "./node_upgrade/aut_node_update.sh"
  "./go_upgrade/aut_go_upgrade.sh"
  "./ubuntu_setup/20.04_fs.sh"
  "./ubuntu_setup/20.04_net.sh"
  "./ubuntu_setup/20.04_utils.sh"

  "./"
)

# Declare parameters for scripts:

## aut_node_update.sh
## fnm: [x.x.x]
## apt: [lts|12|14|16|17]
  node_apt=16
  node_fnm=16.13.0

 declare -a

#


## aut_go_upgade.sh
## Version: [x.x.x]
go=1.17.3


executeScript() {

}