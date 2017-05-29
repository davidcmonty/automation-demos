*** Settings ***
Library                                             AppiumLibrary


*** Variables ***
${RemoteURL}                                        http://localhost:4723/wd/hub
${PlatformName}                                     Android
${PlatformVersion}                                  5.0
${DeviceName}                                       192.168.57.101:5555
${AppLocation}                                      ${CURDIR}/../Builds/zapp.apk
${AutomationName}                                   appium
${AppPackage}                                       nz.co.zenergy.loyaltycard.android.debug
${AppActivity}                                      nz.co.zenergy.loyaltycard.android.MainActivity


*** Test Cases ***
Start android app
    [Documentation]                                 As a user I can...
    [Tags]                                          Android

    close all applications
    Open Application                                ${RemoteURL}  platformName=${PlatformName}  platformVersion=${PlatformVersion}  deviceName=${DeviceName}  app=${AppLocation}  automationName=${AutomationName}  appPackage=${AppPackage}  appActivity=${AppActivity}
    wait until page contains                        Register
    click element                                   xpath=//*[contains(@text,'Register')]
    wait until page contains                        Create an account





