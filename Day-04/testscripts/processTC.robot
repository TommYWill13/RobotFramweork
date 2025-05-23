*** Settings ***
Library  Process

*** Variables ***

*** Test Cases ***
setting variables
    ${result}=    Run Process    Python    hello.py
    Sleep   10s
    Should Be Equal As Integers    ${result.rc}    0
    Log    ${result.stdout}
    Should Be Equal As Strings    ${result.stdout}    Hello World

*** Keywords ***