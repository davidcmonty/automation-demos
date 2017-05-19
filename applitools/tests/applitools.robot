*** Settings ***
Documentation  This is a demo

Library  Selenium2Library
Library  RobotAppEyes
#test from heyday
#robot -d results tests/applitools.robot

*** Variables ***
${URL}  http://z.co.nz/
${BROWSER}  chrome
${OS}  Mac OS X 10.11
${APPLITOOLS_KEY}  D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110

${APPLITOOLS_APPNAME}  Z Desktop
${APPLITOOLS_TESTNAME}  Z Home Page
${PAGE_WIDTH}  1600
${PAGE_HEIGHT}  1200
${MATCH_LEVEL}  LAYOUT


*** Test Cases ***
Load Home Page
    [Documentation]  Test that as a user I can load the home page and confirm the layout is stable
    [Tags]  Regression

    open browser  ${URL}  ${BROWSER}
    open eyes session  ${URL}  ${APPLITOOLS_APPNAME}  ${APPLITOOLS_TESTNAME}  ${APPLITOOLS_KEY}  width=${PAGE_WIDTH}  height=${PAGE_HEIGHT}  osname=${OS}  browsername=${BROWSER}  matchlevel=${MATCH_LEVEL}
    check eyes window  Z Home
    close eyes session

*** Keywords ***

We‘ll need your email to get in touch if you win
