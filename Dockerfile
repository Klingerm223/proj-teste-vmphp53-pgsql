FROM eugeneware/php-5.3
WORKDIR /var/www/html
RUN echo "deb http://archive.debian.org/debian/ jessie main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/99no-check-valid-until
    RUN echo "deb http://archive.debian.org/debian/ jessie main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security/ jessie/updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until \"false\";" > /etc/apt/apt.conf.d/99no-check-valid-until && \
    apt-get update && \
    apt-get install -y vim net-tools --allow-unauthenticated && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    RUN pecl install pdo_pgsql
    # Copia e renomeia o php.ini
    RUN cp /usr/src/php/php.ini-development /usr/local/lib/php.ini
    RUN echo "extension=pdo_pgsql.so" > /tmp/php.ini
    RUN cat /tmp/php.ini >> /usr/local/lib/php.ini 
    RUN rm /tmp/php.ini
   
    RUN service apache2 restart

    #CMD ["bash"]