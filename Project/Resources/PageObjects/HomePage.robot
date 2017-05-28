*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Keywords ***
Verify locator widget
    wait until page contains                        Find a Z near you