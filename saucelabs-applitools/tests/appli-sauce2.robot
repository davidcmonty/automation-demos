*** Settings ***
Library  RobotAppEyes/RobotAppEyes.py
Library  Selenium2Library

*** Variables ***
### Selenium2Library Variables ###
${Timeout}  15

### CSS Variables ###
${Button}  css=button

### Applitools Variables ###
${StartURL}  https://z.co.nz
${Applitools-AppName}  RobotAppEyes_Test_CompareImage
${Applitools-TestName}  Applitools_RobotAppEyes_Test
${Applitools-Key}  D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Width}  1024
${Height}  768

${OSOverride}  OSOverride
${BrowserOverride}  BrowserOverride
${MatchLevel}  LAYOUT
${True}  True

### SauceLabs Variables ###
${SauceLabs-RemoteURL}  http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub
${SauceLabs-DesiredCapabilities}  platform:Windows 7,browserName:internet explorer,version:11.0,screenResolution:1280x960

*** Test Cases ***

Demo Test On SauceLabs
    [Documentation]  Test that as a user I can connect to Saucelabs and compare the screenshot on Applitools
    [Tags]  regression

    Open Browser  ${StartURL}  chrome  None  remote_url=${SauceLabs-RemoteURL}  desired_capabilities=${SauceLabs-DesiredCapabilities}
    Open Eyes Session  ${StartURL}  ${Applitools-AppName}  ${Applitools-TestName}  ${Applitools-Key}  width=${Width}  height=${Height}  includeEyesLog=False  matchlevel=${MatchLevel}
    Check Eyes Window  Main Page New  force_full_page_screenshot=True
    Check Eyes Window  Features Page New   force_full_page_screenshot=True
    Close Eyes Session
    Close Browser

