*** Settings ***
Library    Browser


*** Variables ***
${URL}    https://testautomationpractice.blogspot.com/

*** Test Cases ***

Handling Alerts
    Open Browser    ${URL}    chromium

    ${promise}=    Promise To    Wait For Alert    action=accept    text= I am an alert box!
    Click    \#alertBtn
    ${text} =    Wait For    ${promise}


    ${promise}=    Promise To    Wait For Alert    action=dismiss    text= Press a button!
    Click    \#confirmBtn
    ${text} =    Wait For    ${promise}


    ${promise}=    Promise To    Wait For Alert    action=accept    prompt_input=Hello William !
    Click    \#promptBtn
    ${text} =    Wait For    ${promise}