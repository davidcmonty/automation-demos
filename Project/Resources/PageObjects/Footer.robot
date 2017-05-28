*** Settings ***
Library                                             Selenium2Library


*** Variables ***

### Selectors ###
${SiteSheild}                                      css=#untraceable-element

*** Keywords ***

Can load footer
    wait until page contains                        Z Fuel prices
    wait until page contains                        Z Card
    wait until page contains                        Fly Buys
    wait until page contains                        Airpoints
    wait until page contains                        Call us
    wait until page contains                        Follow us on
    wait until element is visible                   ${SiteSheild}


