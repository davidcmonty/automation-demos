#!/usr/bin/env bash
ECHO Starting batch run at Saucelabs.com
cd /Users/dmontgomery/Sites/Robot\ Framework/Automation\ Demos/Project

ECHO Win10/IE11:
pybot -v REMOTE_URL:http://jeremybates:bca8f2e1-acae-4742-952d-ce1afdfc95b2@ondemand.saucelabs.com:80/wd/hub	-d results/Win7Chrome39 	-v DESIRED_CAPABILITIES:"name:Win10 + IE11,platform:Windows 8.1,browserName:internet explorer,version:11.0"  tests/saucelabs.robot

ECHO Win10/Chrome58:
pybot -v REMOTE_URL:http://jeremybates:bca8f2e1-acae-4742-952d-ce1afdfc95b2@ondemand.saucelabs.com:80/wd/hub	-d results/Win7Chrome40 	-v DESIRED_CAPABILITIES:"name:Win10 + Chrome,platform:Windows 10,browserName:chrome,version:58.0"	tests/saucelabs.robot


