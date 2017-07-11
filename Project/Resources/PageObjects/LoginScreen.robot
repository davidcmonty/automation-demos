*** Settings ***
Library                                             AppiumLibrary
Resource                                            ../CommonMobile.robot

*** Variables ***

### Selectors ###
${LoginButtonID}                                    Already registered?
${LogInID}                                          Log in
${CheckboxID}                                       Checkbox

*** Keywords ***
Open login page
     wait until page contains                       Get great rewards from Z
     click element                                  accessibility_id=${LoginButtonID}
     wait until page contains                       ${LogInID}

Empty form login
     click element                                  accessibility_id=${LogInID}
     page should contain text                       Please enter a valid email address
     page should contain text                       Please accept these to continue with Z App

Login without agreeing to terms
     clear text                                     accessibility_id=you@example.com
     input text                                     accessibility_id=you@example.com  bad_email@gmail.com
     click element                                  accessibility_id=${LogInID}
     page should contain text                       Please accept these to continue with Z App
     page should contain text                       Please enter a valid email address

Invalid login
     clear text                                     accessibility_id=you@example.com
     input text                                     accessibility_id=you@example.com  bad_email@gmail.com
     click element                                  accessibility_id=Checkbox
     click element                                  accessibility_id=${LogInID}
     wait until page contains                       We don't have an account with that email address.

Login
     clear text                                     accessibility_id=you@example.com
     input text                                     accessibility_id=you@example.com  ${ValidUsername2}
     click element                                  accessibility_id=${CheckboxID}
     click element                                  accessibility_id=${LogInID}
     wait until page contains                       Enter your verification code
     click element                                  accessibility_id=5
     sleep                                          2
     click element                                  accessibility_id=4
     sleep                                          2
     tap                                            accessibility_id=5
     sleep                                          2
     click element                                  accessibility_id=3
     wait until page contains                       wait until page contains

