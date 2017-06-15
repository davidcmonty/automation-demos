*** Settings ***
Library                                             Selenium2Library
Library                                             RobotAppEyes/RobotAppEyes.py
Library                                             ../saucelabs.py

Resource                                            Security.robot

*** Variables ***
### General ###
${Browser}                                          chrome

### Saucelabs ###
${DesiredCapabilities}
${RemoteUrl}

### Users ###
${InvalidUsername}                                  !rg^5g&*dwju@heyday.co.nz
${InvalidPassword}                                  !rg^5g&*dwju
${InvalidEmail}                                     !rg^5g&*dwju@
${EMPTY}

### Applitools ###
${AppName}                                          Z Website
${TestName}
${MatchLevel}                                       LAYOUT2

*** Keywords ***
#https://gist.github.com/datakurre/9589707
#requires: pip install simplejson requests

Begin test
    open browser                                    ${StartUrl}
                                                    ...  ${Browser}
                                                    ...  desired_capabilities=${DesiredCapabilities}
                                                    ...  remote_url=${RemoteUrl}

    run keyword if                                  '${RemoteUrl}' != ''
                                                    ...  Update Saucelabs Test Name
                                                    ...  ${SUITE_NAME}: ${TEST_NAME}
                                                    ...  ${RemoteUrl}
End test
    run keyword if                                  '${RemoteUrl}' != ''
                                                    ...  Update Saucelabs Test Result
                                                    ...  ${SUITE_NAME}: ${TEST_NAME}
                                                    ...  ${TEST_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    close browser


Take screenshot
    [Arguments]                                     ${WindowName}

    open eyes session                               appname=${AppName}
                                                    ...  testname=${TestName}
                                                    ...  apikey=${ApplitoolsKey}
                                                    ...  matchlevel=${MatchLevel}
                                                    ...  batchName=${AppName}
                                                    ...  fullPageScreenshot=True

    check eyes window                               ${WindowName}
    close eyes session
