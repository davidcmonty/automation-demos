*** Settings ***
Documentation  This is a demo for connecting to SauceLabs in the most basic way

Library  Selenium2Library

*** Variables ***
${URL}  https://z.co.nz/
${BROWSER}  chrome
${REMOTE_URL}  http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES}  name:Win7 + IE11, platform:Windows 7,browserName:internet explorer,version:11.0
#${DESIRED_CAPABILITIES}  name:iPhone 6s + Safari, appiumVersion:1.6.4,deviceName:iPhone 6s Simulator,deviceOrientation:portrait,platformVersion:10.2,platformName:iOS,browserName:Safari

*** Test Cases ***
Load Home Page
    [Documentation]  Test that as a user I can connect to SauceLabs
    [Tags]  regression

    open browser  ${URL}  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    wait until page contains  Apply for your Z Card
    close browser

*** Keywords ***
