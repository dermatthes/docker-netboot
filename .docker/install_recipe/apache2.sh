

## Installiert Apache2 und setzt den Document-Root auf /opt/www
echo "[RECIPE] apache2.sh"


DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends -y install \
    apache2 ca-certificates


rm -R /var/www/html
ln -s /opt/www /var/www/html
