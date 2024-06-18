#!/bin/bash

# Mise à jour des paquets
sudo apt update
sudo apt upgrade -y

# Installation de PHP et des extensions nécessaires
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

sudo apt install php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-xml php8.2-mbstring -y

# Vérification de l'installation de PHP
php -v

# Installation de MariaDB
sudo apt install -y mariadb-server mariadb-client

# Démarrage et activation de MariaDB
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Sécurisation de l'installation de MariaDB
sudo mysql_secure_installation

# Création d'un utilisateur et d'une base de données MariaDB
sudo mysql -u root -p <<EOF
CREATE USER 'symfony'@'localhost' IDENTIFIED BY 'symfony';
FLUSH PRIVILEGES;
EXIT;
EOF

# Installation de Git
sudo apt install -y git

# Configuration de Git (optionnelle, à personnaliser)
git config --global user.name "Maxime LE GENTIL"
git config --global user.email "maxime.legentil17@gmail.com"

# Clone du dépôt GitHub (remplacez l'URL par celle de votre dépôt)
cd /var/www/html
git clone https://github.com/Maxime-LEGENTIL/vitrine-saas.git
git clone https://github.com/Maxime-LEGENTIL/adminer

cd ~
git clone https://github.com/Maxime-LEGENTIL/api-saas