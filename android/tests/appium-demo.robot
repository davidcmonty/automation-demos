*** Settings ***
Documentation  This is a basic example for setting up tests with Android

Library  AppiumLibrary

*** Variables ***
${REMOTE_URL}  http://127.0.0.1:4723/wd/hub  #URL to appium server
${PLATFORM_NAME}  Android
${PLATFORM_VERSION}  6.0.1
${DEVICE_NAME}  1b325e10048c2c77  #ID of the device (need to find this out)
${APP_LOCATION}  ${CURDIR}/../../app/zapp.apk  #need to put file into project folder
${APP_PACKAGE}  nz.co.zenergy.loyaltycard.android.debug
${APP_ACTIVITY}  nz.co.zenergy.loyaltycard.android.MainActivity
${AUTOMATION_NAME}  appium

*** Test Cases ***
User can open app
    [Documentation]  Test that as a user I can open my app
    [Tags]  regression

    Close All Applications
    Open Application  ${REMOTE_URL}   platformName=${PLATFORM_NAME}  platformVersion=${PLATFORM_VERSION}  deviceName=${DEVICE_NAME}  app=${APP_LOCATION}  automationName=${AUTOMATION_NAME}  appPackage=${APP_PACKAGE}  appActivity=${APP_ACTIVITY}
    Close All Applications  #comment

*** Keywords ***
