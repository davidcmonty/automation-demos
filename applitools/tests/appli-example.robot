*** Settings ***
Library                                             Selenium2Library
Library                                            RobotAppEyes/RobotAppEyes.py


### Notes ###


*** Variables ***
### Selenium2Library Variables ###
${Timeout}                                          15

### Css Variables ###
${Features}                                         button

### Applitools Variables ###
${Applitools-url}                                   http://z.co.nz/
${Applitools-AppName}                               MyAppName2
${Applitools-TestName}                              MyTestName2
${Applitools-Key}                                   D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Width}                                            800
${Height}                                           600
${MatchLevel}                                       LAYOUT2
${baselineName}                                     myBaselineName#3

### SauceLabs Variables ###
${REMOTE_URL}  http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES}  name:Win7 + IE11, platform:Windows 7,browserName:internet explorer,version:11.0

*** Test Cases ***

Test Applitools
    [Documentation]  This test connects to Applitools with a Baseline image that compares against it. This is working
    [Tags]  appli

    Open Browser                                    ${Applitools-url}       chrome
    Open Eyes Session                               appname=${Applitools-AppName}    testname=${Applitools-TestName}     apikey=${Applitools-Key}      width=${Width}      height=${Height}         matchlevel=${MatchLevel}      baselineName=${baselineName}
    Check Eyes Window                               Main Page New
    Close Browser
    Close Eyes Session

Test Saucelabs
    [Documentation]  This is a test that connects to SauceLabs
    [Tags]  sauce

    open browser  ${Applitools-url}  chrome  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    wait until page contains  Find a Z near you
    close browser

Test Saucelabs and Applitools
    [Documentation]  This is a test that connects to SauceLabs and Applitools
    [Tags]  app-sauce

    open browser  ${Applitools-url}  chrome  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    wait until page contains  Find a Z near you
    Open Eyes Session                               appname=${Applitools-AppName}    testname=${Applitools-TestName}     apikey=${Applitools-Key}      width=${Width}      height=${Height}         matchlevel=${MatchLevel}      baselineName=${baselineName}
    Check Eyes Window                               Main Page New
    Close Eyes Session
    close browser


#Test2
#    [Documentation]
#    Open Browser                                    ${Applitools-url}       Firefox
#    Open Eyes Session                               appname=${Applitools-AppName}    testname=${Applitools-TestName}     apikey=${Applitools-Key}      width=${Width}      height=${Height}        matchlevel=${MatchLevel}      baselineName=${baselineName}
#    Check Eyes Window                               Main Page New
#    Close Browser
#    Close Eyes Session



#Test3
#    [Documentation]
#    Open Browser                                    ${Applitools-url}       Chrome
#    Open Eyes Session                               appname=${Applitools-AppName}    testname=${Applitools-TestName}     apikey=${Applitools-Key}      width=${Width}      height=${Height}         matchlevel=${MatchLevel}      fullPageScreenshot=${False}     hideScrollBar=${True}     batchName=${firstBatchName}      matchTimeout=${matchTimeout}
#    Check Eyes Window                               Main Page New
#    Close Browser
#    Close Eyes Session