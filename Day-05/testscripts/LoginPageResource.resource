*** Settings ***
Resource    Appresource.resource
Variables    Pages/LoginPage.py

*** Variables ***
${username}    standard_user
${password}    secret_sauce

*** Keywords ***
Enter Username
    Type Text  ${loginid}  ${username}


Enter Password
    Type Text  ${loginpwd}  ${password}


Click LoginBtn
    Click  ${loginBtn}