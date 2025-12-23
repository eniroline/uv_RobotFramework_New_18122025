*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BrowserName}    Chrome
${UserUrl}    https://www.saucedemo.com/

*** Keywords ***
Open browser and maximize
    [Arguments]    ${UserUrl}    ${BrowserName}
    open browser    ${UserUrl}    ${BrowserName}
    maximize browser window
    log    Starting test with ${BrowserName}
    log    Test URL: ${UserUrl}

Open Chrome Without Password Popups
    [Arguments]    ${UserUrl}    ${BrowserName}
    # Creating a Chrome Options Object
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Add an argument that disables password leak checking
    Call Method    ${options}    add_argument    --disable-features\=PasswordLeakDetection
    # Run in guest mode (this removes the connection to your Google profile)
    Call Method    ${options}    add_argument    --guest
    # Open the browser with clean options
    Open Browser    ${UserUrl}    ${BrowserName}   options=${options}
    Maximize Browser Window

Login To Website Saucedemo
    [Arguments]    ${Username}    ${Password}
    Input Text      id=user-name    ${Username}
    Input Text      id=password     ${Password}
    Click Button    name=login-button