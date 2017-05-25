*** Settings ***
Library                                             Selenium2Library
Library                                             RobotAppEyes/RobotAppEyes.py

*** Variables ***
### Selenium2Library Variables ###
${Timeout}                                          15

### General Variables ###
${Browser}                                          Chrome
${StartURL}                                         http://z.co.nz/

### Applitools Variables ###
${AppName}                                          Z Public Website
${TestName}                                         MyTestName#1
${ApplitoolsKey}                                    D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Width}                                            800
${Height}                                           600
${MatchLevel}                                       LAYOUT2
${BaselineName}                                     MyBaseline#1
${BatchName}                                        MyBatchName#1

### SauceLabs Variables ###
${RemoteURL}                                        http://heydaytesters:95dfab42-65b8-4fec-818c-b777f16593d8@ondemand.saucelabs.com:80/wd/hub
${DesiredCapbabilities-Chrome}                      name:Win7 + Chrome39,platform:Windows 7,browserName:chrome,version:39.0
${DesiredCapbabilities-IE11}                        name:Win7 + IE11,platform:Windows 7,browserName:internet explorer,version:11.0

*** Test Cases ***

Test Applitools
    [Documentation]                                 This test connects to Applitools with a Baseline image
    [Tags]                                          applitools

    open browser                                    ${StartURL}  ${Browser}
    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  width=${Width}  height=${Height}  matchlevel=${MatchLevel}  batchName=${BatchName}  baselineName=${baselineName}
    check eyes window                               Z Home Page
    close browser
    close eyes session

Test Saucelabs
    [Documentation]                                 This is a test that connects to SauceLabs
    [Tags]                                          sauce

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${DesiredCapbabilities-IE11}
    wait until page contains                        Find a Z near you
    close browser

Test Saucelabs and Applitools
    [Documentation]                                 This is a test that connects to SauceLabs and Applitools
    [Tags]                                          app-sauce

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${DesiredCapbabilities-IE11}
    wait until page contains                        Find a Z near you
    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  width=${Width}  height=${Height}  matchlevel=${MatchLevel}  batchName=${BatchName}  baselineName=${BaselineName}
    Check Eyes Window                               Z Home Page
    close eyes session
    close browser


Test Chrome
    [Documentation]                                 This is a test that creates a baseline of Chrome
    [Tags]                                          baseline

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${DesiredCapbabilities-Chrome}
    wait until page contains                        Find a Z near you
    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  width=${Width}  height=${Height}  matchlevel=${MatchLevel}  batchName=${BatchName}
    Check Eyes Window                               Z Home Page
    close eyes session
    close browser


Test IE11
    [Documentation]                                 This is a test that connects to SauceLabs tests against the baseline image which is Chrome
    [Tags]                                          ie

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${DesiredCapbabilities-IE11}
    wait until page contains                        Find a Z near you
    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  width=${Width}  height=${Height}  matchlevel=${MatchLevel}  batchName=${BatchName}
    Check Eyes Window                               Z Home Page
    close eyes session
    close browser


