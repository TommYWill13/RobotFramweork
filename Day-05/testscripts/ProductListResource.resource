*** Settings ***
Resource    Appresource.resource
Variables   Pages/productListPage.py

*** Variables ***


*** Keywords ***

Verify Successful Login
    sleep  3s
    Get Text    ${homeHeader}    contains    Products

Add Item to Cart
    Click  ${itemOne}
    Click  ${itemTwo}
    Sleep  3s

View Cart
    Click  ${cartLink}
