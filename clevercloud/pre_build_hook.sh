#!/bin/sh
echo "=====> Executing prepare.sh clevercloud init script"
cp ./clevercloud/init/parameters.yml ./app/config/parameters.yml

# Custom substitute symfony env vars, because env preprocessor fails to work
var_list="MYSQL_ADDON_HOST MYSQL_ADDON_PORT MYSQL_ADDON_DB MYSQL_ADDON_USER MYSQL_ADDON_PASSWORD MONGODB_ADDON_DB MONGODB_ADDON_URI"
for key in $var_list; do
    echo "Setting $key in parameters.yml"
    sed -i -e 's|%'"$key"'%|'"${!key}"'|' ./app/config/parameters.yml
done
cat ./app/config/parameters.yml


# Force install backwards compatible apcu
echo "=====> Installing apcu_bc"
pecl channel-update pecl.php.net
pecl install apcu_bc
