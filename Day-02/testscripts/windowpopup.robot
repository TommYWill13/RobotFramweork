*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://the-internet.herokuapp.com/windows
${browser}            chromium

*** Test Cases ***
HandleWindowPopup Test
    New Browser    ${browser}    headless=${False}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${URL}

    @{parentid}    Get Page Ids    ACTIVE

    Click    text=/^Click Here/

    ${childwinHandle}    Switch Page    NEW
    Sleep    5s

    Get Title    ==    New Window
    @{pageids}    Get Page Ids    ACTIVE
    Log    ${pageids}

    Sleep    5s
    Close Page

    Switch Page    ${parentid}[0]
