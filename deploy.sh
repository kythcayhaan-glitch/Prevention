#!/bin/bash
set -e

echo "=== 1. Installation MariaDB ==="
sudo apt-get update -q
sudo apt-get install -y mariadb-server git

echo "=== 2. Configuration MariaDB ==="
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo mariadb -e "CREATE DATABASE IF NOT EXISTS celine_symfony CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
sudo mariadb -e "CREATE USER IF NOT EXISTS 'celine'@'localhost' IDENTIFIED BY 'Celine2026!';"
sudo mariadb -e "GRANT ALL ON celine_symfony.* TO 'celine'@'localhost';"
sudo mariadb -e "FLUSH PRIVILEGES;"

echo "=== 3. Extensions PHP ==="
sudo apt-get install -y php php-pdo php-mysql php-intl php-mbstring php-xml php-curl php-zip unzip
php -v

echo "=== 4. Composer ==="
if ! command -v composer &> /dev/null; then
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
fi

echo "=== 5. Clonage du projet ==="
sudo rm -rf /var/www/prevention
sudo git clone https://github.com/kythcayhaan-glitch/Prevention.git /var/www/prevention
sudo chown -R kythcayhaan:www-data /var/www/prevention

echo "=== 6. Dépendances Composer ==="
cd /var/www/prevention
composer install --no-dev --optimize-autoloader --no-interaction

echo "=== 7. Configuration .env.local ==="
cat > /var/www/prevention/.env.local << 'EOF'
APP_ENV=prod
APP_SECRET=a8f3d2e91b7c4f6a0e5d8b2c1f9a3e7d
DATABASE_URL="mysql://celine:Celine2026!@127.0.0.1:3306/celine_symfony?serverVersion=10.11.2-MariaDB&charset=utf8mb4"
EOF

echo "=== 8. Import base de données ==="
sudo mariadb celine_symfony < /var/www/prevention/database/dump.sql

echo "=== 9. Apache pack Symfony ==="
cd /var/www/prevention
composer require symfony/apache-pack --no-interaction || true

echo "=== 10. Cache prod ==="
cd /var/www/prevention
php bin/console cache:clear --env=prod --no-debug
php bin/console cache:warmup --env=prod --no-debug
sudo chown -R www-data:www-data var/
sudo chmod -R 775 var/ public/

echo "=== 11. Configuration Apache ==="
sudo tee /etc/apache2/sites-available/prevention.conf > /dev/null << 'EOF'
<VirtualHost *:80>
    ServerName 192.168.1.169

    Alias /visite /var/www/prevention/public

    <Directory /var/www/prevention/public>
        AllowOverride All
        Require all granted
        Options -Indexes
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/prevention_error.log
    CustomLog ${APACHE_LOG_DIR}/prevention_access.log combined
</VirtualHost>
EOF

sudo a2ensite prevention.conf
sudo a2enmod rewrite
sudo systemctl reload apache2

echo ""
echo "=== DÉPLOIEMENT TERMINÉ ==="
echo "Accès : http://192.168.1.169/visite"
