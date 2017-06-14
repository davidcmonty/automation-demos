*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Variables ***

${ErrorMessage}                                      You found the hole in our donut...



*** Keywords ***
Can see error message
    Load Error Page
    Verify Error Page

Load Error Page
    go to                                           ${StartUrl}/xyz

Verify Error Page
    wait until page contains                        ${ErrorMessage}
