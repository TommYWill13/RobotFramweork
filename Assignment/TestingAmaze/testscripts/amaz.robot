*** Settings ***
Resource    ../resources/amazresources.resource
Resource    ../resources/loginpage.resource
Resource    ../resources/productlistresource.resource
Resource    ../resources/Cartresource.resource

Suite Setup    LaunchApp


*** Variables ***
${username}    tommy1312
${pwd}         Thomas@12


*** Test Cases ***
Valid Login Test
    Click loginCart
    Enter Username
    Enter Password
    Click LoginBtn

Select Product Test  
    Add Item to Cart
    View Cart
    Check Items Listed in Cart
    Remove Item

Confirm Order Test
    Add Item to Cart
    View Cart
    Check Items Listed in Cart
    Checkout Items