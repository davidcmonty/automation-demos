*** Settings ***
Documentation  This is a demo for connecting to SauceLabs

Library  Selenium2Library

Test Setup  Begin Web Test
Test Teardown  End Web Test

#Instructions
#NOTE: I need to watch the Robot Framework tutorial to finish this off

*** Variables ***
${URL} =  https://z.co.nz
${BROWSER} =  chrome
${REMOTE_URL} =
${DESIRED_CAPABILITIES} =
${SITE_NAME} =  Z

*** Test Cases ***
Load Home Page
    [Documentation]  Test that as a user I can connect to SauceLabs
    [Tags]  Regression

    wait until page contains  Apply for your Z Card

*** Keywords ***
Begin Web Test
    Open Browser  ${URL}  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    # this line is optional if you want to see your test case name sooner in the Saucelabs.com UI
    # Can only be run AFTER opening a browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Update Saucelabs Test Name
    ...  ${SUITE_NAME}: ${TEST_NAME}
    ...  ${REMOTE_URL}
   Maximize Browser Window

End Web Test
    # this line updates the test case name, result, and tags in the Saucelabs.com UI
    # after the test case has completed but BEFORE closing the browser
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Update Saucelabs Test Result
    ...  ${SUITE_NAME}: ${TEST_NAME}
    ...  ${TEST_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    close browser

open
