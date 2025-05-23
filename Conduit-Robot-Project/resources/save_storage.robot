*** Settings ***
Library     Browser

*** Variables ***
${email}    William.Thomas@in.bosch.com
${password}    Thomas@12

*** Test Cases ***
Login And Save Storage State
    New Browser    chromium
    New Context
    New Page    https://conduit-realworld-example-app.fly.dev/    wait_until=load
    Click    ul.nav.navbar-nav.pull-xs-right > li:nth-child(2)

    Type Text    input[name='email']    ${email}
    Type Text    input[name='password']    ${password}
    Click     button.btn.btn-lg.btn-primary.pull-xs-right
    Get Text    div h6    *=    Popular Tags
    ${state_file}=    Save Storage State    
    Close Browser