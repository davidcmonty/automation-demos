*** Settings ***
Library                                             AppiumLibrary
Resource                                            ../Resources/CommonMobile.robot
Resource                                            ../Resources/PageObjects/LoginScreen.robot
Resource                                            ../Resources/PageObjects/RegisterScreen.robot

Suite Setup                                         CommonMobile.Begin suite setup
Suite Teardown                                      CommonMobile.End suite setup

Test Setup                                          CommonMobile.Begin test setup
Test Teardown                                       CommonMobile.End test setup


*** Test Cases ***
User can open login page
    [Documentation]                                 As a user I should be abe to get to login page
    [Tags]                                          login

    LoginScreen.Open login page

User can see errors
    [Documentation]                                 As a user I should be abe to see appropriate error messages
    [Tags]                                          login

    LoginScreen.Empty form login

User can not login without agreeing to terms
    [Documentation]                                 As a user I should not be abe to login without accepting terms
    [Tags]                                          login

    LoginScreen.Login without agreeing to terms

User can not login with invalid details
    [Documentation]                                 As a user I should not be abe to login with invalid credentials
    [Tags]                                          login

    Invalid login

User can login
    [Documentation]                                 As a user I should be abe to login successfully with right details
    [Tags]                                          login

    LoginScreen.Login


User can register
    [Documentation]                                 As a user I should be abe to get to register page
    [Tags]                                          register

    RegisterScreen.Open register page
