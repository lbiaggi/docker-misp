#!/bin/bash

change_php_vars(){
    for FILE in /etc/php/*/fpm/php.ini
    do  
        [[ -e $FILE ]] || break
        sed -i "s/memory_limit = .*/memory_limit = $PHP_MEMORY_LIMIT/" "$FILE"
        sed -i "s/max_execution_time = .*/max_execution_time = $PHP_MAX_EXECUTION_TIME/" "$FILE"
        sed -i "s/upload_max_filesize = .*/upload_max_filesize = $PHP_UPLOAD_MAX_FILESIZE/" "$FILE"
        sed -i "s/post_max_size = .*/post_max_size = $PHP_POST_MAX_SIZE/" "$FILE"
    done
}

echo "Configure PHP  | Change PHP values ..." && change_php_vars
echo "Starting PHP FPM"

/usr/sbin/php-fpm7.3 -R -F
