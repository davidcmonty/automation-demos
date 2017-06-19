*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Variables ***

${ErrorMessage}                                      You found the hole in our donut...



*** Keywords ***
Can see error message
    Load error page
    Verify error page

Load error page
    go to                                           ${StartUrl}/xyz

Verify error page
    wait until page contains                        ${ErrorMessage}
