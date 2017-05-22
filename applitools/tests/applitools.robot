*** Settings ***
Documentation  This is a demo to test connection to Applitools

Library  Selenium2Library
Library  RobotAppEyes/RobotAppEyes.py

*** Variables ***
### General ###
${StartURL}  http://z.co.nz/
${Browser}  Chrome
${OS}  Mac OS X 10.11

### Applitools Variables ###
${Applitools-Key}  D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Applitools-AppName}  My Web/App Name
${Applitools-TestName}  My Test Name
${PageWidth}  1600
${PageHeight}  1200
${MatchLevel}  LAYOUT
${baselineName}  MyBaseline

*** Test Cases ***
Load Home Page
    [Documentation]  Test that as a user I can connect to Applitools
    [Tags]  Regression

    open browser  ${StartURL}  ${Browser}
    open eyes session  ${StartURL}  ${Applitools-AppName}  ${Applitools-TestName}  ${Applitools-Key}  width=${PageWidth}  height=${PageHeight}  osname=${OS}  browsername=${Browser}  matchlevel=${MatchLevel}
    check eyes window  Z Home
    close eyes session

*** Keywords ***
