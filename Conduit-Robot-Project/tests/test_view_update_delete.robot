*** Settings ***
Library    Browser
Resource   ../resources/login_page.robot
Resource   ../resources/article_page.robot
Resource   ../resources/home_page.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close Browser

*** Variables ***
${username}    William.Thomas@in.bosch.com
${password}    Thomas@12

*** Test Cases ***
View An Article
    Click    text=Global Feed
    Click    text=Robot1
    Wait For Elements State    css=h1 >> text=Robot1    visible

Update An Article
    Click    text=Robot1
    Update Article    Updated content via Robot Framework.

Delete An Article
    Click    text=Robot1
    Delete Article

*** Keywords ***
Open Browser And Login
    Login Test Case    ${username}    ${password}
