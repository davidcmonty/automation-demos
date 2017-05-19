*** Settings ***
Documentation  This is a demo for connecting to SauceLabs in the most basic way

Library  Selenium2Library
Library  RobotAppEyes

*** Variables ***
#SauceLabs
${URL}  https://z.co.nz/
${BROWSER}  chrome
${REMOTE_URL}  http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES}  name:Win7 + IE11, platform:Windows 7,browserName:internet explorer,version:11.0
#${DESIRED_CAPABILITIES}  name:iPhone 6s + Safari, appiumVersion:1.6.4,deviceName:iPhone 6s Simulator,deviceOrientation:portrait,platformVersion:10.2,platformName:iOS,browserName:Safari

#Applitools
${OS}  Mac OS X 10.11
${APPLITOOLS_KEY}  D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${APPLITOOLS_APPNAME}  Z Desktop
${APPLITOOLS_TESTNAME}  Z Home Page
${PAGE_WIDTH}  1280
${PAGE_HEIGHT}  1024
${MATCH_LEVEL}  LAYOUT

*** Test Cases ***
Load Home Page
    [Documentation]  Test that as a user I can connect to SauceLabs
    [Tags]  regression

    #Connect to SauceLabs
    open browser  ${URL}  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    wait until page contains  Apply for your Z Card


    #Connect to Applitools
    open eyes session  ${URL}  ${APPLITOOLS_APPNAME}  ${APPLITOOLS_TESTNAME}  ${APPLITOOLS_KEY}  width=${PAGE_WIDTH}  height=${PAGE_HEIGHT}  osname=${OS}  browsername=${BROWSER}  matchlevel=${MATCH_LEVEL}
    check eyes window  Z Home
    close eyes session
    close browser

*** Keywords ***



