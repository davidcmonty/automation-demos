*** Settings ***
Library                                             Selenium2Library
Library                                             RobotAppEyes/RobotAppEyes.py

*** Variables ***
### Selenium2Library Variables ###
${Timeout}                                          15

### Css Variables ###
${Features}                                         button

### Applitools Variables ###
${Applitools-url}                                   https://www.applitools.com/
${Applitools-AppName}                               MyAppName
${Applitools-TestName}                              MyTestName
${Applitools-Key}                                   D4HLYgJyunaIGwLWcnCzJdXOrkD9e3jeBIBgmrdFmwU110
${Width}                                            800
${Height}                                           600
${MatchLevel}                                       LAYOUT2
${baselineName}                                     myBaselineName


*** Test Cases ***





Test1
    [Documentation]
    Open Browser                                    ${Applitools-url}       Chrome
    Open Eyes Session                               ${Applitools-url}  ${Applitools-AppName}  ${Applitools-TestName}  ${Applitools-Key}  width=${Width}  height=${Height}  matchlevel=${MatchLevel}   baselineName=${baselineName}
    Check Eyes Window                               Main Page New
    Close Browser
    Close Eyes Session


Test2
    [Documentation]
    Open Browser                                    ${Applitools-url}       Firefox
    Open Eyes Session                               ${Applitools-url}  ${Applitools-AppName}  ${Applitools-TestName}  ${Applitools-Key}  width=${Width}  height=${Height}  matchlevel=${MatchLevel}  baselineName=${baselineName}
    Check Eyes Window                               Main Page New
    Close Browser
    Close Eyes Session



#Test3
#    [Documentation]
#    Open Browser                                    ${Applitools-url}       Chrome
#    Open Eyes Session                               appname=${Applitools-AppName}    testname=${Applitools-TestName}     apikey=${Applitools-Key}      width=${Width}      height=${Height}         matchlevel=${MatchLevel}      fullPageScreenshot=${False}     hideScrollBar=${True}     batchName=${firstBatchName}      matchTimeout=${matchTimeout}
#    Check Eyes Window                               Main Page New
#    Close Browser
#    Close Eyes Session Eyes Session