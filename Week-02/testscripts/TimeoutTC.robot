*** Settings ***
Library    Browser
*** Variables ***

*** Test Cases ***
Using Pageload Timout
    New browser   chromium    headless=False
    New Page    http://uitestingplayground.com    wait_until=load

    Click    "Load Delay"
    Wait For Load State    load

    Click    "Button Appearing After Delay"
    Sleep    2s
    Log To Console    Page Loaded Successfully

    Get Url    contains    loaddelay
*** Keywords ***