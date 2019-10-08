#!/bin/sh

echo "Checking grains.items and test.version on minion"
docker-compose exec minion salt-call --local grains.items && docker-compose exec minion salt-call --local test.version
echo "<Enter> to continue (q to abort)"
read -n 1 k <&1
if [[ $k = q ]]; then
    echo "Abort"
    exit 1
fi
echo "Accepting key on master"
docker-compose exec master salt-key -Ay
echo "Checking grains.items and test.version via master"
docker-compose exec master salt \* grains.items && docker-compose exec master salt \* test.version
echo "<Enter> to continue, (q to abort)"
read -n 1 k <&1
if [[ $k = q ]]; then
    echo "Abort"
    exit 1
fi
echo "Runing versions report on master"
docker-compose exec master salt-run --versions-report
echo "<Enter> to continue, (q to abort)"
read -n 1 k <&1
if [[ $k = q ]]; then
    echo "Abort"
    exit 1
fi
echo "Installing cloud, api, syndic, ssh"
docker-compose exec master apt-get install -y salt-cloud salt-api salt-syndic salt-ssh
echo "re-running versions report"
docker-compose exec master salt-run --versions-report
