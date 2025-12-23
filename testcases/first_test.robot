*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome

*** Keywords ***
Open Chrome Without Password Popups
    # Creating a Chrome Options Object
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Add an argument that disables password leak checking
    Call Method    ${options}    add_argument    --disable-features\=PasswordLeakDetection
    # Run in guest mode (this removes the connection to your Google profile)
    Call Method    ${options}    add_argument    --guest
    # Open the browser with clean options
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Maximize Browser Window

*** Test Cases ***
My First Test Case
    Open Chrome Without Password Popups
    Input Text      id=user-name    standard_user
    Input Text      id=password     secret_sauce
    Click Button    name=login-button
    Sleep    5
    go back
    sleep    3
    Close Browser