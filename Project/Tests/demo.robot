*** Settings ***
Resource                                            ../Resources/Common.robot
Resource                                            ../Resources/PageObjects/LoginPage.robot
Resource                                            ../Resources/PageObjects/ErrorPage.robot
Resource                                            ../Resources/PageObjects/Header.robot

Test Setup                                          Common.Begin test
Test Teardown                                       Common.End test

*** Test Cases ***
User can load home page
    [Documentation]                                 As a user I can load the home page and confirm the layout is as expected
    [Tags]                                          home

    wait until page contains                        Find a Z near you
    Take screenshot                                 Home Page

User can login to cms
    [Documentation]                                 As a CMS user I can login in to the CMS and see that I have successfully logged in
    [Tags]                                          login

    LoginPage.Can login to cms
    Take screenshot                                 Home Page

User can not login to cms
    [Documentation]                                 As a user I should not be able to login to the CMS with invalid credentials
    [Template]                                      LoginPage.Login with invalid details
    [Tags]                                          no-login

    ${InvalidUsername}      ${ValidPassword}
    ${ValidUsername}        ${InvalidPassword}
    ${InvalidUsername}      ${InvalidPassword}
    ${EMPTY}                ${ValidPassword}
    ${ValidUsername}        ${EMPTY}
    ${EMPTY}                ${EMPTY}

User can reset password
    [Documentation]                                 As a CMS user I can reset my password
    [Tags]                                          reset

    LoginPage.Can reset password

User can not reset password
    [Documentation]                                 As a user I can not reset my password
    [Template]                                      LoginPage.Login with invalid reset details
    [Tags]                                          reset

    ${EMPTY}
    ${InvalidUsername}

User can search
    [Documentation]                                 As a user I can perform a search and see the correct results returned
    [Tags]                                          search
    [Template]                                      Header.Can do search

    ${SearchTerm1}
    ${SearchTerm2}
    ${SearchTerm3}

User can see error page
    [Documentation]                                 As a user I can see the error page when I browse to a page that does not exist
    [Tags]                                          error

    ErrorPage.Can see error message
    Take screenshot                                 Error Page
