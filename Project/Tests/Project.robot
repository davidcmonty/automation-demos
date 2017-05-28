*** Settings ***
Resource                                            ../Resources/Common.robot
Resource                                            ../Resources/Security.robot
Resource                                            ../Resources/PageObjects/LoginPage.robot
Resource                                            ../Resources/PageObjects/HomePage.robot
Resource                                            ../Resources/PageObjects/ErrorPage.robot
Resource                                            ../Resources/PageObjects/Header.robot
Resource                                            ../Resources/PageObjects/Footer.robot


*** Test Cases ***
User can login to cms
    [Documentation]                                 As a user I can login in to the CMS and see the CMS username greeting
    [Tags]                                          Login

    Common.Begin Local Test
    LoginPage.Can login to cms


User can not login to cms
    [Documentation]                                 As a user I should not be able to login to the CMS with invalid credentials
    [Template]                                      LoginPage.Login with invalid details
    [Tags]                                          NoLogin

    ${InvalidUsername}      ${Password}
    ${ValidUsername}        ${InvalidPassword}
    ${InvalidUsername}      ${InvalidPassword}
    ${EMPTY}                ${ValidPassword}
    ${ValidUsername}        ${EMPTY}
    ${EMPTY}                ${EMPTY}

User can reset password
    [Documentation]                                 As a user I can reset my password
    [Tags]                                          Reset

    LoginPage.Can reset password

User can not reset password
    [Documentation]                                 As a user I can not reset my password
    [Template]                                      LoginPage.Login with invalid reset details
    [Tags]                                          Noreset

    ${EMPTY}
    ${InvalidUsername}

User can search
    [Documentation]                                 Test that as a user I can perform a search and see the correct results returned
    [Tags]                                          Search

    Common.Begin Local Test
    Can do search                                   Fuel
    Header.Can load header
    Footer.Can load footer
    Common.End Test

User can open home page
    [Documentation]                                 Test that as a user I can open the home page and see the locator widget
    [Tags]                                          Home

    Common.Begin Local Test
    HomePage.Verify Home Page
    Header.Can load header
    Common.End Test

User can see error page
    [Documentation]                                 Test that as a user I can see the error page when I browse to a page that does not exist
    [Tags]                                          Regression

    Common.Begin Local Test
    ErrorPage.Verify Error Page
    Common.End Test

User can see chrome layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SauceLabsChrome}
    Common.Confirm Page Layout                      Win10 + Chrome 58.0   ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch:${AppName}: Home Page
    close browser

User can see ie layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SauceLabsIE11}
    Common.Confirm Page Layout                      Win10 + IE 11  ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Home Page
    close browser

User can see edge layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Layout

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SaucelabsEdge}
    Common.Confirm Page Layout                      Win10 + MS Edge  ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Home Page
    close browser

User can see phone layout
    [Documentation]                                 Test that as a user I can load the home page and see the desktop layout is correct
    [Tags]                                          Phone

    open browser                                    ${StartUrl}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=${SauceLabsChrome}
    Common.Confirm Page Layout                      Phone Layout   ${AppName}: Home Page  ${StartUrl}  ${Browser}  Batch: ${AppName}: Home Page
    close browser
