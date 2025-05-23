*** Settings ***
Resource    Appresource.resource
Variables    Pages/CartPage.py

*** Variables ***


*** Keywords ***
Check Items Listed in Cart
    ${itemCount}    Get Element Count    ${items}
    RETURN ${itemCount}

Checkout Items
    Click     ${chkoutBtn}
    Sleep    2s

Remove Items from Cart
    Click  ${removeItemOne}
    Click  ${removeItemTwo}
