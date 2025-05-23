*** Settings ***
Resource    Appresource.resource
Resource    LoginPageResource.resource
Resource    ProductListResource.resource
Resource    CartPageResource.resource
Resource    CheckoutPageResource.resource
Suite Setup    LaunchApp
Suite Teardown    Close App

*** Test Cases ***
Valid Login Test
    Enter Username
    Enter Password
    Click LoginBtn
    Verify Successful Login 
    
Select Product Test
    Add Item to Cart
    View Cart
    ${itemCount}    Check Items Listed in Cart
    Log    ${itemCount}
    IF    ${itemCount} > 0
        Remove Items from Cart
    ELSE
        Log    No Items in Cart.
        
    END
    
    

Confirm Order Test
    Checkout Items
    Provide User Details
    Confirm Order