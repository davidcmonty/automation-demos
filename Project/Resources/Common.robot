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
${TestName}                                         MyTestName
${Width}                                            800
${Height}                                           600
${MatchLevel}                                       LAYOUT2
${BaselineName}                                     MyBaseline
${BatchName}                                        MyBatchName

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