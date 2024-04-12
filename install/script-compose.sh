basedonnees="\n# ##> BASE DE DONNÉES \/\/ ADMINER ET mariadb\n  adminer:\n    platform: linux\/x86_64\n    container_name: adminer_\${NAME}_\${ADMINER_VERSION}\n    image: adminer:\${ADMINER_VERSION}\n    restart: unless-stopped\n    ports:\n      - \${ADMINER_LOCALHOST_PORT}:\${ADMINER_DOCKER_PORT}\n    env_file:\n      - .env\n    depends_on:\n      - database\n\n\n###> doctrine\/doctrine-bundle ###\n  database:\n    platform: linux\/x86_64\n    container_name: mariadb_\${NAME}_\${MARIADB_VERSION}\n    image: mariadb:\${MARIADB_VERSION}\n    restart: unless-stopped\n    env_file:\n      - .env\n    volumes:\n      - ..\/\${FOLDER_DATASQL}:\/docker-entrypoint-initdb.d\/\n      - ..\/\${FOLDER_DATABASE}:\/var\/lib\/mysql\n    ports:\n      - \${SQL_LOCALHOST_PORT}:\${SQL_DOCKER_PORT}\n###< doctrine\/doctrine-bundle ###\n# ##< BASE DE DONNÉES \/\/ ADMINER ET mariadb\n "

sed -i "s/image: \${IMAGES_PREFIX:-}app-php/image: backend_\${NAME}:\${BACKEND_VERSION}/g" $file_rel_compose
sed -i "/image: backend_\${NAME}:\${BACKEND_VERSION}/a \    container_name: backend_\${NAME}:\${BACKEND_VERSION}" $file_rel_compose
sed -i "s/HTTP_PORT/HTTP_LOCALHOST_PORT/g" $file_rel_compose
sed -i "s/HTTPS_PORT/HTTPS_LOCALHOST_PORT/g" $file_rel_compose
sed -i "s/HTTP3_PORT/HTTP3_LOCALHOST_PORT/g" $file_rel_compose
sed -i '/^ *ports: *$/,/^ *# HTTP *$/ s/^ *ports: *$/\    env_file:\n      - .env\n&/' $file_rel_compose
sed -i "s/- target: 80/- target: \${HTTP_DOCKER_PORT:-80}/g" $file_rel_compose
sed -i '/# HTTPS/{n; s/^ *- target: 443 *$/\      - target: ${HTTPS_DOCKER_PORT:-443}/}' $file_rel_compose
sed -i '/# HTTP\/3/{n; s/^ *- target: 443 *$/\      - target: ${HTTP3_DOCKER_PORT:-443}/}' $file_rel_compose
sed -i "0,/^$/ s/^$/${basedonnees}\n/" $file_rel_compose
sed -i "/\  caddy_config:/a \ \n###> doctrine/doctrine-bundle ###\n\  ${name}_mariadb:\n###< doctrine/doctrine-bundle ###\n" $file_rel_compose
sed -i "/\        protocol: udp/a \    depends_on:\n\      - database" $file_rel_compose

line="     DATABASE_URL: postgresql:\/\/\${POSTGRES_USER:-app}:\${POSTGRES_PASSWORD:-!ChangeMe!}@database:5432\/\${POSTGRES_DB:-app}?serverVersion=\${POSTGRES_VERSION:-15}&charset=\${POSTGRES_CHARSET:-utf8}"

# escaped_line=$(sed 's/[[\.*^$/]/\\&/g' <<< "$line"
sed -i "/$line/d" $file_rel_compose

# file_rel_compose_o
sed -i '/\    tty: true/a \ \n\n###> doctrine\/doctrine-bundle ###\n\  database:\n    env_file:\n      - .env\n\    ports:\n\      - \${SQL_LOCALHOST_PORT}:${SQL_DOCKER_PORT}\n###< doctrine\/doctrine-bundle ###\n' $file_rel_compose_o

pause s 5 m

# sed -i 's/RUN install-php-extensions pdo_pgsql/RUN install-php-extensions pdo_mysql/g' $file_rel_dockerfile
sed -i '/###> recipes ###/a \\n###> doctrine\/doctrine-bundle ###\nRUN install-php-extensions pdo_mysql\n###< doctrine\/doctrine-bundle ### \n' $file_rel_dockerfile

pause s 5
