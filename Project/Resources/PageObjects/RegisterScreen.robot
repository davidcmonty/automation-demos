*** Settings ***
Library                                             AppiumLibrary


*** Variables ***

### Selectors ###
${IDRegisterButton}                                 Register


*** Keywords ***
Open register page
     Wait Until Page Contains                       Get great rewards from Z
     Click Element                                  accessibility_id=${IDRegisterButton}
     Wait Until Page Contains                       Create an account
