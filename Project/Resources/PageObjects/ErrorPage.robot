*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Variables ***

${ErrorMessage}                                      You found the hole in our donut...



*** Keywords ***
Load Error Page
    go to                                           ${StartUrl}/xyz

Verify Error Page
    wait until page contains                        ${ErrorMessage}
