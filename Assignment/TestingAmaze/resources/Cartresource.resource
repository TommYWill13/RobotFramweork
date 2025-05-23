*** Settings ***
Resource        ../resources/amazresources.resource
Variables       ../pages/cartpage.py
 
*** Variables ***
 
*** Keywords ***
Check Items Listed in Cart
    ${itemsList}=    Get Elements    ${items}
    ${itemsCount}=   Get Length      ${itemsList}
    Should Be True   ${itemsCount} > 0    Items are listed in
 
Checkout Items
    Click           ${placeorder}
    Sleep           3s
    Type Text    ${clickName}    user
    Type Text    ${clickcard}    card
    Click     css=button.btn.btn-primary[onclick="purchaseOrder()"]
    Sleep    5s

Remove Item
  #Click    ${removeItemTwo}
    ${delete_links}=    Get Elements    css=#tbodyid a[onclick^="deleteItem"]
    FOR    ${link}    IN    @{delete_links}
        Click    ${link}
    END
    Sleep    10s