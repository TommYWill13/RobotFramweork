*** Settings ***
Library    Browser

*** Variables ***


*** Test Cases ***
sample test case

    ${sum}=    Add    1    2

    Should Be Equal As Integers    3    ${sum}

    ${changedName}    Change Nickname    TestUser    RobotTestUser


*** Keywords ***

Add
    [Arguments]    ${a}    ${b}
    ${sum}=    Evaluate    ${a} + ${b}
    RETURN    ${sum}

Change Nickname
    [Arguments]    ${oldname}    ${newname}
    Log To Console    ${newname}
    RETURN    ${newname}
