*** Settings ***
Library   RequestsLibrary
Library   Collections
Library   JSONLibrary


*** Variables ***
${apptoken}    000f0cec53de8246b5e11b54bff50535
${weatherAPIURL}   https://api.openweathermap.org/data/2.5


*** Test Cases ***
Get Request with APP ID

    [Documentation]   Get Request with APIKEY   
    [Tags]    GetRequesywithAPIKEY
    ${params}    Create Dictionary
    ${params}    Set To Dictionary    ${params}    lat=13.082680
    ${params}    Set To Dictionary    ${params}    lon=80.270721
    ${params}    Set To Dictionary    ${params}    appid=${apptoken}
    

    Create Session    myAuth    ${weatherAPIURL}
    ${response}    GET On Session    myAuth    /weather    params=${params}
    Log    ${response.status_code}
    Log    ${response.content}

    Should Contain    ${response.content}    Park Town

*** Keywords ***