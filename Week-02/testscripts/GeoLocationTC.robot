*** Settings ***
Library     Browser
*** Variables ***

*** Test Cases ***
GeoLocation Test
    New browser   chromium    headless=False
        ${persmissions} =    Create List    geolocation
        New Context    permissions=${persmissions}
        Set Geolocation    33.748997    -84.387985    100
    
    New Page    https://oldnavy.gap.com/stores    wait_until=load
    Sleep    3s
    ${storelist}    Get Elements    //div[contains(text(), 'Atlanta')]
    
    Log    ${storelist}
    ${storecount}    Get Length    ${storelist}
    Log    ${storecount}
    Should Be True    ${storecount} > 0    No stores found in Atlanta


*** Keywords ***