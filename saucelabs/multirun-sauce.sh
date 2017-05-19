#!/usr/bin/env bash
ECHO Starting batch run at Saucelabs.com
cd /Users/dmontgomery/Sites/Robot\ Automation\ Demos/Saucelabs

ECHO Win7/Chrome39:
pybot -v REMOTE_URL:http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub	-d results/Win7Chrome39 	-v DESIRED_CAPABILITIES:"name:Win7 + Chrome39, platform:Windows 7,browserName:chrome,version:39.0"  tests/sauce.robot

ECHO Win7/Chrome40:
pybot -v REMOTE_URL:http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub	-d results/Win7Chrome40 	-v DESIRED_CAPABILITIES:"name:Win7 + Chrome40, platform:Windows 7,browserName:chrome,version:40.0"	tests/sauce.robot


