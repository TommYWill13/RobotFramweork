*** Settings ***
Library    AxeLibrary
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Google Accessiblity Test
    Open Browser    https://robotframework.org/    chrome

    ${results.violations}    Run Accessibility Tests    returnfile.json
    Log To Console   Violation counts : ${results.violations}

    Log Readable Accessibility Result    violations

    Get Json Accessibility Result

    Close Browser