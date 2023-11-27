FROM mediawiki:1.40

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql

# Download and install DynamicPageList3
RUN wget https://github.com/Universal-Omega/DynamicPageList3/archive/refs/tags/3.5.1.tar.gz -O /tmp/dpl3.tar.gz \
    && tar -xzf /tmp/dpl3.tar.gz -C /var/www/html/extensions \
    && rm /tmp/dpl3.tar.gz \
    && mv /var/www/html/extensions/DynamicPageList3-3.5.1 /var/www/html/extensions/DynamicPageList3

# Download and install CSS
RUN wget https://extdist.wmflabs.org/dist/extensions/CSS-REL1_40-385a5c2.tar.gz -O /tmp/css.tar.gz \
    && tar -xzf /tmp/css.tar.gz -C /var/www/html/extensions \
    && rm /tmp/css.tar.gz