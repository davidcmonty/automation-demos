*** Settings ***
Library                                             AppiumLibrary


*** Variables ***
${RemoteURL}                                        http://127.0.0.1:4723/wd/hub
${PlatformName}                                     iOS
${PlatformVersion}                                  10.2
${DeviceName}                                       iPhone 6
${AppLocation}                                      ${CURDIR}/../Builds/Zapp.app
${BundleID}                                         com.zenergy.coffeecard.debug
${AutomationName}                                   XCUITest


*** Test Cases ***
Start ios app
    [Documentation]                                 As a user I can...
    [Tags]                                          iOS

    Close All Applications
    Open Application                                ${RemoteURL}  platformName=${PlatformName}  platformVersion=${PlatformVersion}  deviceName=${DeviceName}  app=${AppLocation}  automationName=${AutomationName}  bundleId=${BundleID}
    wait until page contains                        Get great rewards from Z!
    wait until page contains                        Register
    click element                                   accessibility_id=Register




