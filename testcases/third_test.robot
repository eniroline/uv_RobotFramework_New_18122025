*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot

*** Test Cases ***
My Third Test Case
    Open Chrome Without Password Popups
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    name=login-button
    Sleep    5
    go back
    sleep    3
    Close Browser