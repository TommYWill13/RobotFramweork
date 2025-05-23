*** Settings ***
Library    Browser
Resource    ../resources/login_page.robot


*** Keywords ***
Go To New Article Page
    Go To    https://conduit-realworld-example-app.fly.dev/#/editor
    Wait For Elements State    css=input[placeholder="Article Title"]    visible