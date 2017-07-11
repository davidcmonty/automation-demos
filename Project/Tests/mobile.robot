*** Settings ***
Library                                             AppiumLibrary
Resource                                            ../Resources/CommonMobile.robot
Resource                                            ../Resources/PageObjects/LoginScreen.robot
Resource                                            ../Resources/PageObjects/RegisterScreen.robot

Suite Setup                                         CommonMobile.Begin suite setup
Suite Teardown                                      CommonMobile.End suite setup

Test Setup                                          CommonMobile.Begin test setup
Test Teardown                                       CommonMobile.End test setup


### Instructions ###
# This is where all your tests are run from.
# You will use mini-tests (Keywords) created in the PageObjects directory where functionality is grouped together.
# Below are the instructions to get your Appium Server up and running to create your mobile Robot Framework tests.


## Start Appium Server ##
# 1. Open Appium
# 2. Click 'Start Server'
# 3. Click 'Start New Session'
# 4. Add your 'Desired Capabilities' (see Docs folder for Android and iOS examples) and Save


## How to run a test locally on Android ##
# 1. Open Genymotion and start device
# 2. Click 'Start Session' on Appium
# 3. Run the command: robot -v type:android -d results -i test tests/mobile.robot


## How to run a test locally on iOS ##
# 1. Ensure iOS Simulator PlatformVersion is loaded: XCode > Preferences > Components
# 2. Click 'Start Session' on Appium
# 3. Run the command: robot -v type:android -d results -i test tests/mobile.robot


*** Test Cases ***
User can open login page
    [Documentation]                                 As a user I should be abe to get to login page
    [Tags]                                          test

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
