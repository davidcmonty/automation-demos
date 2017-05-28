*** Settings ***
Resource                                            ../Resources/Common.robot
Resource                                            ../Resources/Security.robot


*** Test Cases ***

### Home Page ###
User can see chrome layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SaucelabsEdge}
    Verify Page Layout                              Win10 + Chrome 58.0  ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch:${AppName}: Home Page
    close browser

User can see ie layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SaucelabsEdge}
    Verify Page Layout                              Win10 + IE 11  ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Home Page
    close browser

User can see edge layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SaucelabsEdge}
    Verify Page Layout                              Win10 + MS Edge  ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Home Page
    close browser

User can see phone layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Phone

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SaucelabsEdge}
    Verify Page Layout                              Phone Layout   ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Home Page
    close browser

*** Keywords ***
Verify Page Layout
    [Arguments]                                     ${TestName}  ${WindowName}  ${StartURL}  ${Browser}  ${BatchName}

    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  matchlevel=${MatchLevel}  batchName=${BatchName}
    check eyes window                               ${WindowName}  force_full_page_screenshot=True
    close eyes session

