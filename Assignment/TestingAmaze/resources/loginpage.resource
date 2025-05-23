*** Settings ***
Resource    ../resources/amazresources.resource
Variables       ../pages/loginpage.py
 
*** Variables ***
${username}    AnjaliRai
${pwd}         Anjalirai88
 
*** Keywords ***
Click loginCart
    Click    ${clicklogin}

Enter Username
    Type Text    ${loginid}    ${username}
 
Enter Password
    Type Text    ${loginpwd}    ${pwd}

Click LoginBtn
    Click    ${loginBtn}
    Sleep    2