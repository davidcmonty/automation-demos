*** Settings ***
Resource                                            ../Resources/Common.robot
Resource                                            ../Resources/Security.robot


*** Test Cases ***
Test Chrome full
    [Documentation]                                 Full screen compare test
    [Tags]                                          fullwidth

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + Chrome (Full),platform:Windows 10,browserName:chrome,version:58.0
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 1  apikey=${ApplitoolsKey}  matchlevel=Layout2  batchName=Z Home Page
    Check Eyes Window                               Z Home Page  force_full_page_screenshot=True
    close eyes session
    close browser

Test IE11 full
    [Documentation]                                 Full screen compare test
    [Tags]                                          fullwidth

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + IE11 (Full),platform:Windows 8.1,browserName:internet explorer,version:11.0
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 2  apikey=${ApplitoolsKey}  matchlevel=Layout2  batchName=Z Home Page
    Check Eyes Window                               Z Home Page  force_full_page_screenshot=True
    close eyes session
    close browser

Test IE11 custom width
    [Documentation]                                 Full screen compare test
    [Tags]                                          fullwidth

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + IE11 (999),platform:Windows 8.1,browserName:internet explorer,version:11.0
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 3  apikey=${ApplitoolsKey}  width=999  height=666  matchlevel=Layout2  batchName=Z Home Page
    Check Eyes Window                               Z Home Page  force_full_page_screenshot=True
    close eyes session
    close browser

Test MSedge small width
    [Documentation]                                 Smaller screen test
    [Tags]                                          smallwidth

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + MS Edge (800),platform:Windows 10,browserName:MicrosoftEdge,version:14.14393
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 4  apikey=${ApplitoolsKey}  width=800  height=600  matchlevel=Layout2  batchName=Z Home Page
    Check Eyes Window                               Z Home Page
    close eyes session
    close browser

Test MSedge very small width
    [Tags]                                          Very Small screen test

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + MS Edge (375),platform:Windows 10,browserName:MicrosoftEdge,version:14.14393
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 5  apikey=${ApplitoolsKey}  width=375  height=667  matchlevel=Layout2  batchName=Z Home Page
    Check Eyes Window                               Z Home Page
    close eyes session
    close browser

Test Chrome full batch2
    [Documentation]                                 Test batch names
    [Tags]                                          batch

    open browser                                    ${StartURL2}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + Chrome (Full),platform:Windows 10,browserName:chrome,version:58.0
    wait until page contains                        The digital experience filling the seats at New Zealand’s strongest developmental theatre.
    open eyes session                               appname=Heyday Public Website  testname=Test 6  apikey=${ApplitoolsKey}  matchlevel=Layout2  batchName=Heyday Home Page
    Check Eyes Window                               Heyday Home Page  force_full_page_screenshot=True
    close eyes session
    close browser

Test IE11 full batch2
    [Documentation]                                 Test batch names
    [Tags]                                          batch

    open browser                                    ${StartURL2}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + IE11 (Full),platform:Windows 8.1,browserName:internet explorer,version:11.0
    wait until page contains                        The digital experience filling the seats at New Zealand’s strongest developmental theatre.
    open eyes session                               appname=Heyday Public Website  testname=Test 7  apikey=${ApplitoolsKey}  matchlevel=Layout2  batchName=Heyday Home Page
    Check Eyes Window                               Heyday Home Page  force_full_page_screenshot=True
    close eyes session
    close browser

Test MSedge very small width batch2
    [Tags]                                          Very Small screen test

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + MS Edge (320),platform:Windows 10,browserName:MicrosoftEdge,version:14.14393
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 8  apikey=${ApplitoolsKey}  width=320  height=568  matchlevel=Layout2  batchName=Heyday Home Page
    Check Eyes Window                               Heyday Home Page
    close eyes session
    close browser

Test MSedge very small width batch2
    [Tags]                                          Very Small screen test

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:Win10 + MS Edge (320),platform:Windows 10,browserName:MicrosoftEdge,version:14.14393
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 8  apikey=${ApplitoolsKey}  width=320  height=568  matchlevel=Layout2  batchName=Heyday Home Page
    Check Eyes Window                               Heyday Home Page
    close eyes session
    close browser


Test iPhone
    [Tags]                                          phone

    open browser                                    ${StartURL}  ${Browser}  remote_url=${RemoteURL}  desired_capabilities=name:iPhone 6s,appiumVersion:1.6.4,deviceName:iPhone 6s Simulator,deviceOrientation:portrait,platformVersion:10.3,platformName:iOS,browserName:Safari
    wait until page contains                        Find a Z near you
    open eyes session                               appname=Z Public Website  testname=Test 8  apikey=${ApplitoolsKey}  matchlevel=Layout2  batchName=Z Home Page
    Check Eyes Window                               Heyday Home Page  force_full_page_screenshot=True
    close eyes session
    close browser

*** Keywords ***

