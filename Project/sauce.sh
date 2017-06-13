#!/usr/bin/env bash

#tunnel/bin/sc -u jeremybates -k bca8f2e1-acae-4742-952d-ce1afdfc95b2 --pidfile pid > /tmp/sauce-connect-log.txt &
#sleep 1
#while ! grep -m1 'Sauce Connect is up, you may start your tests.' < /tmp/sauce-connect-log.txt; do
#sleep 1
#done
#echo Sauce-Connect is up and running
#kill $(cat pid)

echo Starting batch run at Saucelabs.com

echo Win10 + E11:
robot -v REMOTE_URL:http://jeremybates:bca8f2e1-acae-4742-952d-ce1afdfc95b2@ondemand.saucelabs.com:80/wd/hub -d results/Win10+IE11 -i test -v DESIRED_CAPABILITIES:"name:Win10 + IE11,platform:Windows 8.1,browserName:internet explorer,version:11.0" tests/project.robot

echo Win10 + Chrome58:
robot -v REMOTE_URL:http://jeremybates:bca8f2e1-acae-4742-952d-ce1afdfc95b2@ondemand.saucelabs.com:80/wd/hub -d results/Win10+Chrome58 -i test -v DESIRED_CAPABILITIES:"name:Win10 + Chrome,platform:Windows 10,browserName:chrome,version:58.0" tests/project.robot

#echo iPhone 6s
#robot -v REMOTE_URL:http://jeremybates:bca8f2e1-acae-4742-952d-ce1afdfc95b2@ondemand.saucelabs.com:80/wd/hub -d results/Win10+Chrome40 -v DESIRED_CAPABILITIES:"name:iPhone 6s,appiumVersion:1.6.4,deviceName:iPhone 6s Simulator,deviceOrientation:portrait,platformVersion:10.3,platformName:iOS,browserName:Safari" tests/project.robot




