*** Settings ***
Library                                             Selenium2Library
Library                                             RobotAppEyes/RobotAppEyes.py

*** Variables ***
### Selenium2Library Variables ###
${Timeout}                                          15


### Css Variables ###
${button}                                         css=button


### Applitools Variables ###
${START_URL}  https://z.co.nz
${Applitools-AppName}                               RobotAppEyes_Test_CompareImage
${Applitools-TestName}                              Applitools_RobotAppEyes_Test
${Applitools-Key}                                   D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Width}                                            1024
${Height}                                           768

${OSOverride}                                       OSOverride
${BrowserOverride}                                  BrowserOverride
${MatchLevel}                                       LAYOUT2
${True}                                             True

${SAUCE_REMOTE_URL}  http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub
#${DESIRED_CAPABILITIES}  platform:OS X 10.10,version:50.0,screenResolution:1280x960
${DESIRED_CAPABILITIES}  platform:Windows 7,browserName:internet explorer,version:11.0,screenResolution:1280x960

*** Test Cases ***

Demo Test On SauceLabs

    Open Browser  ${START_URL}      chrome    None    remote_url=${SAUCE_REMOTEURL}    desired_capabilities=${DESIRED_CAPABILITIES}
    Open Eyes Session  ${START_URL}       ${Applitools-AppName}    ${Applitools-TestName}     ${Applitools-Key}      width=${Width}      height=${Height}   includeEyesLog=False       matchlevel=${MatchLevel}
    Check Eyes Window  Main Page New   force_full_page_screenshot=True
    #Click Element  ${button}
    Check Eyes Window  Features Page New     force_full_page_screenshot=True
    Close Eyes Session
    Close Browser
