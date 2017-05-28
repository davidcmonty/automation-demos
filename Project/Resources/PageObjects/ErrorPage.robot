*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Keywords ***
Load Error Page
    go to                                           ${StartUrl}/xyz

Verify Error Page
    wait until page contains                        You found the hole in our donut...
