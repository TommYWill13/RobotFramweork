*** Settings ***
Library    Browser
Library    DataDriver    file=data/articles.xlsx    sheet_name=Sheet1
Resource   ../resources/login_page.robot
Resource   ../resources/article_page.robot
Resource   ../resources/home_page.robot

Suite Setup       Open Browser And Login
Suite Teardown    Close Browser
Test Template     Create New Article From Data

*** Variables ***
${username}    William.Thomas@in.bosch.com
${password}    Thomas@12

*** Test Cases ***
Create Article
    [Template]    Create New Article From Data
    | Title 1    | Description 1    | Body 1    | Tag 1 |
    | Title 2    | Description 2    | Body 2    | Tag 2 |

*** Keywords ***
Open Browser And Login
    Login Test Case    ${username}    ${password}

Create New Article From Data
    [Arguments]    ${title}    ${description}    ${body}    ${tags}
    Go To New Article Page
    Create New Article    ${title}    ${description}    ${body}    ${tags}
