*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot
Resource                                            ../../Resources/Security.robot


*** Variables ***

### Selectors ###
${LoginUsername}                                    css=#MemberLoginForm_LoginForm_Email
${LoginPassword}                                    css=#MemberLoginForm_LoginForm_Password
${ResetUsername}                                    css=#MemberLoginForm_LostPasswordForm_Email
${LoginButton}                                      css=#MemberLoginForm_LoginForm_action_dologin
${SubmitButton}                                     css=#MemberLoginForm_LostPasswordForm_action_forgotPassword


*** Keywords ***

### Can Log In ###
Can login to cms
    Load cms login page
    Confirm cms login page loads
    Enter valid login details
    Sumbit login
    Confirm logged in

Load cms login page
    go to                                           ${StartURL}/admin

Confirm cms login page loads
    wait until page contains                        Log in
    wait until page contains                        Remember me next time?

Enter valid login details
    input text                                      ${LoginUsername}  ${ValidUsername}
    input text                                      ${LoginPassword}  ${ValidPassword}

Sumbit login
     click element                                  ${LoginButton}
     open bro

Confirm logged in
    wait until page contains                        Hi
    wait until page contains                        Super Administrator

### Can Not Log In ###
Login with invalid details
    [Arguments]                                     ${username}  ${password}

    Load cms login page
    Confirm cms login page loads
    input text                                      ${LoginUsername}  ${username}
    input text                                      ${LoginPassword}  ${password}
    Sumbit login
    Confirm cms login page loads

### Reset Password ###
Confirm reset page loads
    click link                                      I've lost my password
    wait until page contains                        Lost Password


Enter valid reset details
    input text                                      ${ResetUsername}  ${ValidUsername2}

Submit reset
    click element                                   ${SubmitButton}
    sleep                                           5s

Confirm reset success
    wait until page contains                        Thank you! A reset link has been sent to '${ValidUsername2}', provided an account exists for this email address.
    wait until page contains                        Lost Password

Can reset password
    Load cms login page
    Confirm cms login page loads
    Confirm reset page loads
    Enter valid reset details
    Submit reset
    Confirm reset success

Confirm page not reset page
    wait until page does not contain                Thank you! A reset link has been sent to '${ValidUsername2}', provided an account exists for this email address.

Login with invalid reset details
    [Arguments]                                     ${username}

    Load cms login page
    Confirm reset page loads
    input text                                      ${ResetUsername}  ${username}
    Submit reset
    Confirm page not reset page
