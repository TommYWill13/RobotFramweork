*** Settings ***

Library    RequestsLibrary
Library    Collections


*** Variables ***
${baseurl}    https://demoqa.com/utilities/weather/city
${city}    chennai    


*** Test Cases ***
Get Weather_info
    Create session    myGetSess    ${baseurl}
        ${response}    GET On Session    myGetSess    ${city}


        Status Should Be    200    ${response}
        Should Be Equal As Strings    ${response.reason}    OK
        ${reqbody} =     Convert To String    ${response.content}
        Log    ${reqbody}

        Should Contain    ${reqbody}    chennai

        Log To Console    ${response.headers}[Content-Type]
        Dictionary Should Contain Key    ${response.headers}    Content-Type

    

*** Keywords ***