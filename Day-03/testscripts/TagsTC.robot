*** Settings ***
Force Tags    req-42
Default Tags    owner-john    smoketest

*** Variables ***
${HOST}    10.0.1.42


*** Test Cases ***

No own tags
    [Documentation]  This test has tags owner-john, smoke and req-42.
    No Operation

with own tags
    [Documentation]     this test has tags host-10.0.1.32 and req-42
    [Tags]    owner-mrx     Notready
    Log    ${HOST}

Own tags with varaibles
    [Documentation]     this test has tags host-10.0.1.32 and req-42
    [Tags]    host-${HOST}
    Log    "Hello"


Empty own tags
    [Documentation]     this test has only req-42
    [Tags]
    No Operation


Set Tags and Remove Tags Keywords
    [documentation]    This test has tags mytag and owner-john
    Set Tags    mytag     owner-john
    Remove Tags    smoketest    req-*