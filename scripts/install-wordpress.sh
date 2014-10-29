#!/bin/bash

# Load the variables from the ENV
DB_USER=$DB_USER
DB_PASS=$DB_PASS
DB_NAME=$DB_NAME

WORKDIR=$WORKDIR
RUN_USER=$RUN_USER

WORDPRESS_PKG="/tmp/wordpress.tar.gz"

echo -n "Fetch latest wordpress package from wordpress.org... " >&2
if [ ! -f "$WORDPRESS_PKG" ]; then
    wget https://wordpress.org/latest.tar.gz -O "$WORDPRESS_PKG"
    echo "[Done]" >&2
else
    echo "[Already present]" >&2
fi

echo -n "Unpacking Wordpress... " >&2
tar xzvf "$WORDPRESS_PKG"
if [ $? -ne 0 ]; then
    echo "[Error]" >&2
    echo "Check the logs" >&2
    exit 1
else
    echo "[Success]"
fi

echo "Ensuring the workdir is present... " >&2
cd wordpress
cp -a * .* "$WORKDIR"

echo "Preparing Wordpress configuration... " >&2
cd $WORKDIR
cp wp-config-sample.php wp-config.php
# Set the DB details
sed -i.bak "s/database_name_here/$DB_NAME/g;s/username_here/$DB_USER/g;s/password_here/$DB_PASS/g;" wp-config.php
# Set the salt details
# SALT=$(wget https://api.wordpress.org/secret-key/1.1/salt/ -O -) 
# echo "$SALT" >> wp-config.php

echo "Setting permissions"
sudo chown -R $RUN_USER:$RUN_USER "$WORKDIR"
