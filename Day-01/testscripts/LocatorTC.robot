*** Settings ***
Library    Browser
Library    Collections

*** Variables ***

*** Test Cases ***

Finding Elements by Implicit Selectors
    Open Browser    https://www.saucedemo.com/     chromium     headless=False

    Type Text    \#user-name    standard_user
        Type Text    //input[@name='password']    secret_sauce
        Click    "Login"

Finding Elements by Explicit Selectors
    Open Browser    https://www.saucedemo.com/     chromium     headless=False
    Type Text    css=#user-name    standard_user
    Type Text    xpath=//input[@name='password']    secret_sauce
    Click    text="Login"
    
    @{items}    Get Elements    .inventory_item_name
    Log    ${items}
    
    ${first_item}   Get From List    ${items}      0
    ${item_text}    Get Text    ${first_item}
    Should Be Equal    ${item_text}    Sauce Labs Backpack
    Log    ${item_text}

Finding elements by Explicit selectors with RegEx
    Open Browser    https://testautomationpractice.blogspot.com/     chromium     headless=False


    #i for case sensitive
    click    text=/^Playwright.*$/i

    #cascading
    ${pageHeading}    Get Element    //div[@class='post-outer']/div[1] >> .post-title.entry-title
    Get Text    ${pageHeading}    ==    PlaywrightPractice
