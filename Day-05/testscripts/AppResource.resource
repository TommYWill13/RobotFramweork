*** Settings ***
Library    Browser

*** Variables ***
${baseurl}    https://www.saucedemo.com
${browser}    chromium

*** Keywords ***
LaunchApp
    Open Browser    ${baseurl}    ${browser}

Close App
    Close Browser


