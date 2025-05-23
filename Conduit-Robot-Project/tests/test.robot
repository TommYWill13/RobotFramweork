*** Settings ***
Library    Browser
Library    DataDriver    file=data/articles.xlsx    sheet_name=Sheet1
Resource   ../resources/login_page.robot
Resource   ../resources/article_page.robot
Resource   ../resources/home_page.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close Browser

*** Variables ***
${username}    William.Thomas@in.bosch.com
${password}    Thomas@12

*** Test Cases ***
Create Article
    [Template]    Create New Article From Data
    | Title 1    | Description 1    | Body 1    | Tag 1 |
    | Title 2    | Description 2    | Body 2    | Tag 2 |

View An Article
    [Template]    NONE
    Click    text=Global Feed
    Click    text=Robot1
    Wait For Elements State    css=h1 >> text=Robot1    visible

Update An Article
    [Template]    NONE
    Click    text=Robot1
    Update Article    Updated content via Robot Framework.

Delete An Article
    [Template]    NONE
    Click    text=Robot1
    Delete Article

*** Keywords ***
Open Browser And Login
    Login Test Case    ${username}    ${password}

Create New Article From Data
    [Arguments]    ${title}    ${description}    ${body}    ${tags}
    Go To New Article Page
    Create New Article    ${title}    ${description}    ${body}    ${tags}