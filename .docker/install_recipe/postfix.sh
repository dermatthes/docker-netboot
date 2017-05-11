#!/bin/bash

echo "[RECIPE] postfix_mailserver.sh"

## Mailserver installieren (Postfix)

if [ "$MAIL_NAME" == "" ]
then
    echo "[ERROR] MAIL_NAME not set in .env file"
    exit 1
fi

echo "postfix postfix/main_mailer_type string Internet site" > preseed.txt
echo "postfix postfix/mailname string $MAIL_NAME" >> preseed.txt
## Use Mailbox format.
debconf-set-selections preseed.txt
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -q -y \
    postfix

postconf myorigin=$MAIL_NAME


