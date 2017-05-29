*** Settings ***
Library                                             AppiumLibrary
Library                                             Selenium2Library


*** Variables ***
${RemoteURL}                                        http://localhost:4723/wd/hub
${PlatformName}                                     Android
${PlatformVersion}                                  6.0.1
${DeviceName}                                       1b325e10048c2c77
${AutomationName}                                   appium
${AppPackage}                                       co.nz.quantiful.wave.debug
${AppActivity}                                      co.nz.android.whstl.mobile.StartActivity


*** Test Cases ***
Start android app
    [Documentation]                                 As a user I can...
    [Tags]                                          Android

    Close All Applications
    Open Application                                ${RemoteURL}  platformName=${PlatformName}  platformVersion=${PlatformVersion}  deviceName=${DeviceName}  app=${CURDIR}/../app/prg.apk  automationName=${AutomationName}  appPackage=${AppPackage}  appActivity=${AppActivity}
    Sleep                                           20
    Close All Applications





