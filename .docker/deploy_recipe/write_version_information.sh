
echo "[RECIPE] write_version_information.sh"

VERSION_FILE=/app/_version.php

if [ "$VERSION_FILE" != "" ]
then
    CURDATE=`date`
    sed -i "s|{CI_BUILD_ID}|$CI_BUILD_ID|g" $VERSION_FILE
    sed -i "s|{CI_BUILD_REF_SLUG}|$CI_BUILD_REF_SLUG|g" $VERSION_FILE
    sed -i "s|{GITLAB_USER_EMAIL}|$GITLAB_USER_EMAIL|g" $VERSION_FILE
    sed -i "s|{DATE}|$CURDATE|g" $VERSION_FILE
fi