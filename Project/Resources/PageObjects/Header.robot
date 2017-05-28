*** Settings ***
Library                                             Selenium2Library
Resource                                            ../../Resources/Common.robot


*** Variables ***

### Selectors ###
${SearchField}                                      css=#Input_search
${SearchButton}                                     css=#Submit_search
${Pagination}                                       css=.gsc-cursor-page
${SearchQuery}                                      css=.searchresults__formcontainer__header__query


*** Keywords ***

### Home Page ###
Can load home page
    go to                                           ${StartUrl}

Can load header
    wait until page contains                        Motorists
    wait until page contains                        Business
    wait until page contains                        About Z
    wait until page contains                        Why
    wait until page contains                        Contact
    wait until page contains                        Investor Centre
    wait until page contains                        Find us


### Search ###
Can do search
    [Arguments]                                     ${SearchTerm}

    input text                                      ${SearchField}  ${SearchTerm}
    click element                                   ${SearchButton}
    wait until page contains                        Results for '${SearchTerm}'
    element should be visible                       ${Pagination}