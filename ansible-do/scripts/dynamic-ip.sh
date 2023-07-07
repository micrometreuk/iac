#!/bin/bash
web_ip=$(doctl compute droplet list | grep web | awk '{print$2, "ansible_host=" $3 }')
cat  > inventory/site-hosts <<EOL
[web]
${web_ip}
[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_user=root
EOL
