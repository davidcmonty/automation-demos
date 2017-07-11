*** Settings ***
Library                                             RobotAppEyes/RobotAppEyes.py
Library                                             ../saucelabs.py
Library                                             AppiumLibrary
Resource                                            Security.robot

*** Variables ***

### Saucelabs ###
${DesiredCapabilities}
${RemoteUrl}                                        http://127.0.0.1:4723/wd/hub
${Type}

### Users ###
${ValidUsername}                                    dev@heyday.co.nz
${ValidUsername2}                                   david@heyday.co.nz
${InvalidUsername}                                  !rg^5g&*dwju@heyday.co.nz
${InvalidPassword}                                  !rg^5g&*dwju
${InvalidEmail}                                     !rg^5g&*dwju@
${EMPTY}

### Applitools ###
${AppName}                                          <Your app name here>
${TestName}
${MatchLevel}                                       LAYOUT2

### iOS Desired Capabilities ###
${iOSPlatformName}                                  iOS
${iOSDeviceName}                                    iPhone 6
${iOSBundleID}                                      com.zenergy.coffeecard.debug
${iOSPlatformVersion}                               9.3
${iOSAppLocation}                                   ${CURDIR}/../Builds/zapp-ios.app
${iOSAutomationName}                                XCUITest

### Android Desired Capabilities ###
${AndroidPlatformName}                              Android
${AndroidDeviceName}                                192.168.57.101:5555
${AndroidPlatformVersion}                           6.0
${AndroidAppPackage}                                nz.co.zenergy.loyaltycard.android.debug
${AndroidAppLocation}                               ${CURDIR}/../Builds/zapp-android.apk
${AndroidAutomationName}                            appium


*** Keywords ***

Begin suite setup
  close all applications
  Run Keyword If                                    '${Type}'=='ios'
                                                    ...  open application
                                                    ...  ${RemoteURL}
                                                    ...  platformName=${iOSPlatformName}
                                                    ...  platformVersion=${iOSPlatformVersion}
                                                    ...  deviceName=${iOSDeviceName}
                                                    ...  app=${iOSAppLocation}
                                                    ...  automationName=${iOSAutomationName}
                                                    ...  bundleId=${iOSBundleID}

  Run Keyword If                                    '${Type}'=='android'
                                                    ...  open application
                                                    ...  ${RemoteURL}
                                                    ...  platformName=${AndroidPlatformName}
                                                    ...  platformVersion=${AndroidPlatformVersion}
                                                    ...  deviceName=${AndroidDeviceName}
                                                    ...  app=${AndroidAppLocation}
                                                    ...  automationName=${AndroidAutomationName}

End suite setup
  close all applications

Begin test setup
  portrait

End test setup
  capture page screenshot

### Applitools ###

# This is the third party layout comparison tool that takes a baseline screenshot on the first test run and then compares subsequent screenshots against this.
# ${WindowName} is the argument you give the 'Take screenshot' keyword i.e. 'Take screenshot  Home page' which you put into any test to take a screenshot.


Take screenshot
    [Arguments]                                     ${WindowName}

    open eyes session                               appname=${AppName}
                                                    ...  testname=${TestName}
                                                    ...  apikey=${ApplitoolsKey}
                                                    ...  matchlevel=${MatchLevel}
                                                    ...  batchName=${AppName}
                                                    ...  fullPageScreenshot=True

    check eyes window                               ${WindowName}
    close eyes session
