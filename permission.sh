#!bin/bash

find sites/ -type f -exec chmod 664 {} \; && find sites/ -type d -exec chmod 775 {} \; &&
chown www-data:www-data -R sites/