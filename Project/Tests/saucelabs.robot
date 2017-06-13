*** Settings ***
Library                                                 Selenium2Library


*** Variables ***
${URL}  http://www.z.co.nz
${BROWSER}  chrome
${REMOTE_URL}
${DESIRED_CAPABILITIES}


*** Test Cases ***
User can open home
    Begin Sauce Test
    wait until page contains                           Find a Z near you
    End Sauce Test


*** Keywords ***
Begin Sauce Test
    Open Browser  ${URL}  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window

End Sauce Test
    close browser