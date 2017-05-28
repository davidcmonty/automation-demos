*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Keywords ***
Load Home Page
    go to                                           ${StartUrl}

Verify Home Page
    wait until page contains                        Find a Z near you

