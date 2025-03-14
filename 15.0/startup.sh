#!/bin/bash

function install_alokai() {
    if [ ! -d "/mnt/extra-addons/graphql_alokai" ];
    then 
        git clone --recurse-submodules --branch 15.0 https://github.com/erpgap/alokai-odoo /mnt/extra-addons/
        /entrypoint.sh odoo -d v15_odoo --max-cron-threads 0 --no-http --stop-after-init -i graphql_alokai
        /entrypoint.sh odoo shell -d v15_odoo --max-cron-threads 0 --stop-after-init --no-http < /start_script.py 
    fi
}
install_alokai && /entrypoint.sh odoo
exit 0