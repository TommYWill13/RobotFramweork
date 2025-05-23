*** Settings ***
Library     Browser

*** Keywords ***
Login Test Case
    [Arguments]    ${username}    ${password}
    New Context    viewport={"width": 1420, "height": 1080}
    New Browser    chromium    headless=False
    New Page    https://conduit-realworld-example-app.fly.dev/    wait_until=load
    Click    ul.nav.navbar-nav.pull-xs-right > li:nth-child(2)

    Type Text    input[name='email']    ${username}
    Type Text    input[name='password']    ${password}
    Click     button.btn.btn-lg.btn-primary.pull-xs-right
    Get Text    div h6    *=    Popular Tags

    ${state_File} =     Save Storage State
        Close Context
    
    New Context    storageState=${state_File}
    New Page    https://conduit-realworld-example-app.fly.dev/    wait_until=load
    Get Text    div h6    *=    Popular Tags
    Sleep    3s