*** Settings ***
Library                                             RobotAppEyes/RobotAppEyes.py
Library                                             ../saucelabs.py
Library                                             AppiumLibrary
Resource                                            Security.robot

*** Variables ***

### Saucelabs ###
${DesiredCapabilities}
${RemoteUrl}

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

### iOS Connection ###
${iOSPlatformName}                                  iOS
${iOSPlatformVersion}                               9.3
${iOSDeviceName}                                    iPhone 6
${iOSAppLocation}                                   ../../Builds/zapp.app
${BundleID}                                         com.zenergy.coffeecard.debug
${iOSAutomationName}                                XCUITest


### Android Connection ###
${AndroidPlatformName}                              Android
${AndroidPlatformVersion}                           7.0
${AndroidDeviceName}                                192.168.57.101:5555
${AndroidAppLocation}                               ../../Builds/zapp.apk
${AppPackage}                                       nz.co.zenergy.loyaltycard.android.debug
${AndroidAutomationName}


*** Keywords ***
#https://gist.github.com/datakurre/9589707
#requires: pip install simplejson requests


Begin web test



Begin suite setup
  close all applications
  Run Keyword If                                    '${type}'=='ios'
                                                    ...  Open Application  ${RemoteURL}
                                                    ...  platformName=${iOSPlatformName}
                                                    ...  platformVersion=${iOSPlatformVersion}
                                                    ...  deviceName=${iOSDeviceName}
                                                    ...  app=${iOSAppLocation}
                                                    ...  automationName=${iOSAutomationName}
                                                    ...  bundleId=${BundleID}

  Run Keyword If                                    '${type}'=='android'
                                                    ...  Open Application
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
