*** Settings ***
Resource   ..//resources/amazresources.resource
Variables   ..//pages/loginpage.py
Variables   ..//pages/cartpage.py
Resource   ..//resources/productlistresource.resource
Variables   ..//pages/productlistpage.py

*** Keywords ***
Verify Successful Login
    sleep    5s
    Get Text    ${homeHeader}    contains     PRODUCT STORE
 
Add Item to Cart
    Click    text=Home
    Click    ${itemname}
    Click    ${itemOne}
    sleep    3s
 
View Cart
    Click    ${cartLink}
    Sleep    3
