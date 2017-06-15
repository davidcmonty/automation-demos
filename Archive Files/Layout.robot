*** Settings ***
Resource                                            ../Resources/Common.robot
Resource                                            ../Resources/Security.robot


*** Test Cases ***

Check IE layout
    #open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + IE11,platform:Windows 8.1,browserName:internet explorer,version:11.0
    Verify Page Layout                              ${TestName}  Home Page  ${StartUrl}  ${Browser}  Batch:${AppName}
    #close browser

User can see ie layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SaucelabsEdge}
    Verify Page Layout                              Win10 + IE 11  ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Z Home Page
    close browser

User can see edge layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Test

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

    open eyes session                               appname=${AppName}  testname=${TestName}  apikey=${ApplitoolsKey}  matchlevel=${MatchLevel}  batchName=${BatchName}  fullPageScreenshot=True
    check eyes window                               ${WindowName}
    close eyes session

Begin
    [Arguments]

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${Remote_Url}  desired_capabilities=${DesiredCapabilities}

End


#Begin Sauce Test
#    Open Browser  ${STARTURL}  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
#    # this line is optional if you want to see your test case name sooner in the Saucelabs.com UI
#    # Can only be run AFTER opening a browser
#    Run keyword if  '${REMOTE_URL}' != ''
#    ...  Update Saucelabs Test Name
#    ...  ${SUITE_NAME}: ${TEST_NAME}
#    ...  ${REMOTE_URL}
#   Maximize Browser Window

#End Sauce Test
#    # this line updates the test case name, result, and tags in the Saucelabs.com UI
#    # after the test case has completed but BEFORE closing the browser
#    Run keyword if  '${REMOTE_URL}' != ''
#    ...  Update Saucelabs Test Result
#    ...  ${SUITE_NAME}: ${TEST_NAME}
#    ...  ${TEST_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
#    close browser

