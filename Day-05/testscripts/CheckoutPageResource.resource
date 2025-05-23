*** Settings ***
Resource    Appresource.resource
Variables    Pages/CheckoutPage.py


*** Variables ***
${firstnamevalue}    Test
${lastnamevalue}    User
${postalcodevalue}    12345
${successmessage}    Thank you for your order!

*** Keywords ***
Provide User Details
    Type Text    ${firstname}    ${firstnamevalue}
    Type Text    ${lastname}    ${lastnamevalue}
    Type Text    ${postalcode}    ${postalcodevalue}
    Click    ${continuebutton}
    Sleep    3s

Confirm Order
    Click  ${finishBtn}
    Sleep    3s
    Get Text    ${checkoutComplete}    contains    ${successmessage}


