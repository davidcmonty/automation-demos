#!/usr/bin/env bash

#
sauce-connect/bin/sc -u automaton -k e906258c-993a-4ff9-a2ce-b2fe841ef326 --pidfile pid > /tmp/sauce-connect-log.txt &
sleep 1
while ! grep -m1 'Sauce Connect is up, you may start your tests.' < /tmp/sauce-connect-log.txt; do
sleep 1
done

echo
echo ==============================================================================
echo Sauce Connect is now running and the tests are being executed on Saucelabs
echo ==============================================================================
echo

echo Win10 + E11:
robot -v REMOTE_URL:http://automaton:e906258c-993a-4ff9-a2ce-b2fe841ef326@ondemand.saucelabs.com:80/wd/hub -d results/Win10+IE11 -v DESIRED_CAPABILITIES:"name:Win10 + IE11,platform:Windows 8.1,browserName:internet explorer,version:11.0" Tests/demo.robot
echo

echo Win10 + Chrome58:
robot -v REMOTE_URL:http://automaton:e906258c-993a-4ff9-a2ce-b2fe841ef326@ondemand.saucelabs.com:80/wd/hub -d results/Win10+Chrome58 -v DESIRED_CAPABILITIES:"name:Win10 + Chrome,platform:Windows 10,browserName:chrome,version:58.0" Tests/demo.robot
echo

echo OSX + Firefox:
robot -v REMOTE_URL:http://automaton:e906258c-993a-4ff9-a2ce-b2fe841ef326@ondemand.saucelabs.com:80/wd/hub -d results/Win10+Chrome58 -v DESIRED_CAPABILITIES:"name:OSX + Firefox,platform:OS X 10.12,browserName:firefox,version:52.0" Tests/demo.robot
echo

kill $(cat pid)

