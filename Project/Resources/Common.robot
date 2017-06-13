*** Settings ***
Library                                             Selenium2Library
Library                                             RobotAppEyes/RobotAppEyes.py

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
Begin test
    open browser                                    ${StartUrl}
                                                    ...  ${Browser}
                                                    ...  desired_capabilities=${DesiredCapabilities}
                                                    ...  remote_url=${RemoteUrl}
End test
    close browser
