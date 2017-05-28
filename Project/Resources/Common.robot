*** Settings ***
Library                                             Selenium2Library
Library                                             RobotAppEyes/RobotAppEyes.py
Resource                                            Security.robot

*** Variables ***
${Browser}                                          chrome
${InvalidUsername}                                  !rg^5g&*dwju@heyday.co.nz
${InvalidPassword}                                  !rg^5g&*dwju
${InvalidEmail}                                     !rg^5g&*dwju@
${EMPTY}

### Applitools ###
${AppName}                                          Z Website
${TestName}                                         MyTestName
${ApplitoolsKey}                                    D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Width}                                            800
${Height}                                           600
${MatchLevel}                                       LAYOUT2
${BaselineName}                                     MyBaseline
${BatchName}                                        MyBatchName

### SauceLabs ###
${SauceLabsChrome}                                  name:Win10 + Chrome,platform:Windows 10,browserName:chrome,version:58.0
${SauceLabsIE11}                                    name:Win10 + IE11,platform:Windows 8.1,browserName:internet explorer,version:11.0
${SaucelabsEdge}                                    name:Win10 + MS Edge,platform:Windows 10,browserName:MicrosoftEdge,version:14.14393

*** Keywords ***
Begin Local Test
    open browser                                    ${StartUrl}  ${Browser}

End Test
    close browser

Confirm Page Layout
    [Arguments]                                     ${TestName}  ${WindowName}  ${StartURL}  ${Browser}  ${BatchName}

    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  matchlevel=${MatchLevel}  batchName=${BatchName}
    check eyes window                               ${WindowName}  force_full_page_screenshot=True
    close eyes session

