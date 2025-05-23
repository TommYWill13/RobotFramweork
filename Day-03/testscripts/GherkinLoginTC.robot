*** Settings ***
Library    Browser

*** Variables ***
${browser}            chromium
${URl}               https://the-internet.herokuapp.com/login

*** Test Cases ***

valid Login
    Given browser is opened to login page
    When user "tomsmith" logs in with password "SuperSecretPassword!"
    Then Should display success message

*** Keywords ***

browser is opened to login page
    Open Browser    ${URl}    ${browser}

user "${username}" logs in with password "${password}"
    Type Text      \#username    ${username}
    Type Text      \#password    ${password}
    Click          button.radius

Should display success message
    ${flashMessage}    Get Text    \#flash    *=    You logged into a secure area!
    Log    ${flashMessage}