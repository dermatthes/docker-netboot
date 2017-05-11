
echo "[RECIPE] set_timezone.sh"

TZ="Europe/Berlin"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
