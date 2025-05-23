*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    JSONLibrary
 
*** Test Cases ***
Reading from Text File
    ${str}=    Get File    ${CURDIR}/output.txt
    Should Contain    ${str}    successfully completed
 
Reading data from CSV File
    ${FILE_CONTENT}=    Get File    ${CURDIR}/inputData.csv
    Log    File Content: ${FILE_CONTENT}
    @{LINES}=    Split to Lines and Remove Header    ${FILE_CONTENT}
    ${SUM}=    Calculate Sum From List    ${LINES}
    Log    Final SUM: ${SUM}

Create Employee JSON File
    ${jsonFile}=    Set Variable  ${CURDIR}/employee.json

    #create Json Data
    ${jsondata}=    Create Dictionary    name=John Doe    age=30    salary=5000    department=IT
    ${address}=    Create Dictionary    area=Downtown    city=New York    street=5th Avenue    country=USA
    ${jsondata}=    Set To Dictionary    ${jsondata}    address=${address}
    Log    JSON: ${jsondata}
    Dump JSON To File    ${jsonFile}    ${jsondata}
    ${updatedata}=    Set To Dictionary    ${jsondata}    salary=6000
    Log    Updated JSON: ${updatedata}
    Dump JSON To File    ${jsonFile}    ${updatedata}
 
*** Keywords ***
Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    RETURN    @{LINES}
 
Calculate Sum From List
    [Arguments]    ${LIST}
    ${RESULT}=    Set Variable    0
    FOR    ${LINE}    IN    @{LIST}
        Log    ${LINE}
        @{COLUMNS}=    Split String    ${LINE}    separator=,
        ${VALUE}=    Get From List    ${COLUMNS}    2
        Log    ${VALUE}
        ${RESULT}=    Evaluate    ${RESULT}+${VALUE}
    END
    RETURN    ${RESULT}