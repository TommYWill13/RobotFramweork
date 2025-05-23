*** Settings ***
Library    Browser


*** Keywords ***
Create New Article
    [Arguments]    ${title}    ${description}    ${body}    ${tags}
    Fill Text    css=input[placeholder="Article Title"]    ${title}
    Fill Text    css=input[placeholder="What's this article about?"]    ${description}
    Fill Text    css=textarea[placeholder="Write your article (in markdown)"]    ${body}
    Fill Text    css=input[placeholder="Enter tags"]    ${tags}
    Click    text=Publish Article
    Wait For Elements State    css=h1 >> text=${title}    visible

Update Article
    [Arguments]    ${new_body}
    Click    text=Edit Article >> nth=1
    Fill Text    css=textarea[placeholder="Write your article (in markdown)"]    ${new_body}
    Click    text=Update Article

Delete Article
    Handle Future Dialogs    accept
    Click    text=Delete Article >> nth=1