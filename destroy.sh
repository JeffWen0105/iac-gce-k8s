#!/bin/bash

read -p "Destory All GCE...Is this ok?[y/n]: " ans
[[ $ans == 'y' ]] && terraform destroy --auto-approve