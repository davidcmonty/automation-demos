*** Settings ***
Library                                             AppiumLibrary


*** Variables ***
${RemoteURL}                                        http://localhost:4723/wd/hub
${PlatformName}                                     Android
${PlatformVersion}                                  6.0
${DeviceName}                                       192.168.57.101:5555
${AppLocation}                                      ${CURDIR}/../Builds/z-app-demo-android.apk
${AutomationName}                                   appium
${AppPackage}                                       nz.co.zenergy.loyaltycard.android.debug
${AppActivity}                                      nz.co.zenergy.loyaltycard.android.MainActivity


*** Test Cases ***
Start android app
    [Documentation]                                 As a user I can...
    [Tags]                                          Android

    close all applications
    open application                                ${RemoteURL}  platformName=${PlatformName}  platformVersion=${PlatformVersion}  deviceName=${DeviceName}  app=${AppLocation}  automationName=${AutomationName}  appPackage=${AppPackage}  appActivity=${AppActivity}
    wait until page contains                        Get great rewards from Z!
    wait until page contains                        Register
    click element                                   accessibility_id=Register
    wait until page contains                        Create an account


# 1. Start Genymotion
# 2. Start Device
# 3. Wait until device open
# 4. Start Appium
# 5. Start Appium server
# 6. Start new session
# 7. ...



