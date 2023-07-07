#!/bin/bash
wgserver_ip=$(doctl compute droplet list | grep wgserver | awk '{print$2, "ansible_host=" $3 }')
cat  > inventory/hosts <<EOL
[wg]
${wgserver_ip}
EOL
