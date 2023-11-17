FROM mediawiki:1.40

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pgsql pdo_pgsql

# Download and install DynamicPageList
RUN wget https://extdist.wmflabs.org/dist/extensions/intersection-REL1_40-57ecfad.tar.gz -O /tmp/intersection.tar.gz \
    && tar -xzf /tmp/intersection.tar.gz -C /var/www/html/extensions \
    && rm /tmp/intersection.tar.gz