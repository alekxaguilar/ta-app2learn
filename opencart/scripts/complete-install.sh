sed -i "s/define('DIR_STORAGE', DIR_SYSTEM . 'storage/define('DIR_STORAGE', '\/var\/www\/storage/g" /var/www/html/config.php \
 && sed -i "s/define('DIR_STORAGE', DIR_SYSTEM . 'storage/define('DIR_STORAGE', '\/var\/www\/storage/g" /var/www/html/admin/config.php \
 && mv /var/www/html/system/storage/ /var/www/ \
 && rm -R /var/www/html/install \
 && echo "Installation completed. Don't call the police!"