*** Settings ***
Library                                             AppiumLibrary


*** Variables ***
${RemoteURL}                                        http://127.0.0.1:4723/wd/hub
${PlatformName}                                     iOS
${PlatformVersion}                                  10.2
${DeviceName}                                       iPhone Simulator
${AppLocation}                                      /Users/ashekhara/Library/Developer/Xcode/DerivedData/WebDriverAgent-brdadhpuduowllgivnnvuygpwhzy/Build/Products/Debug-iphonesimulator/IntegrationApp.app
${BundleID}                                         nz.co.wpp.debug
${AutomationName}                                   appium
${AppPackage}                                       co.nz.quantiful.wave.debug
${AppActivity}                                      co.nz.android.whstl.mobile.StartActivity


*** Test Cases ***
Start ios app
    [Documentation]                                 As a user I can...
    [Tags]                                          iOS

    Close All Applications
    Open Application                                ${RemoteURL}  platformName=${PlatformName}  platformVersion=${PlatformVersion}  deviceName=${DeviceName}  app=${AppLocation}  automationName=${AutomationName}  bundleId=${BundleID}
    Sleep                                           20
    Close All Applications
