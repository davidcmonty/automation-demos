*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Variables ***

### Selectors ###
${CSSLocatorSearch}                                 css=a.button--primary
${CSSFirstResult}                                   css=ul.autocomplete__results li:first-child


*** Keywords ***

Can search for station
    click element                                   ${CSSLocatorSearch}
    wait until page contains                        Looking for a specific service or product?
    input text                                      css=#locatorsearch  Auck
    sleep                                           2s
    click element                                   ${CSSFirstResult}
    wait until page contains                        Filter
    sleep                                           2s
    Take screenshot                                 Find a Z Service Station Results Page
