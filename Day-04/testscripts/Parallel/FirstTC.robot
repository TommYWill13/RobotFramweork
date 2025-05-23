*** Settings ***
Library    Browser

*** Variables ***
${browser}            chromium
${username}           tomsmith
${password}           SuperSecretPassword!

*** Test Cases ***
Valid Login Test
    New Browser    ${browser}    headless=${False}
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       https://the-internet.herokuapp.com/login
    Type Text      \#username    ${username}
    Type Text      \#password    ${password}
    Click          \#login >> .radius
    ${pagetitle}=  Get Title
    Should Be Equal    ${pagetitle}    The Internet
    Log To Console     ${pagetitle}

    ${url}=       Get Url
    Should Contain    ${url}    secure
    Log To Console    ${url}
