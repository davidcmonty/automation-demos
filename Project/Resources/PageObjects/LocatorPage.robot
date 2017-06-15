*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Variables ***

### Selectors ###
${CSSLocatorSearch}                                 css=a.button--primary



*** Keywords ***

Can search for station
    click element                                   ${CSSLocatorSearch}
    wait until page contains                        Looking for a specific service or product?
    input text                                      Auck
