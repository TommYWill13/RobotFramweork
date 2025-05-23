*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://the-internet.herokuapp.com/iframe
${browser}            chromium

*** Test Cases ***
iframe Test
    Open Browser    ${URL}    ${browser}    headless=${False}
    ${label}    Get Text    div > h3
    Log    ${label}

    ${txtfromframe}    Get Text    iframe#mce_0_ifr >>> id=tinymce
    Log    ${txtfromframe}
    
    ${txtfrompage}    Get Text  span.tox-statusbar__branding
    Log    ${txtfrompage}
