*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Chrome Without Password Popups
    [Arguments]    ${user_url}    ${user_browser}
    # Creating a Chrome Options Object
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Add an argument that disables password leak checking
    Call Method    ${options}    add_argument    --disable-features\=PasswordLeakDetection
    # Run in guest mode (this removes the connection to your Google profile)
    Call Method    ${options}    add_argument    --guest
    # Open the browser with clean options
    open browser    ${user_url}    ${user_browser}   options=${options}
    Maximize Browser Window
    log    Starting test in ${user_browser}
    log    Test URL: ${user_url}

Close Browser and log
    close browser
    log    Finished test.

Login to Webpage
    [Arguments]    ${username}    ${user_password}
    Input Text      id=user-name    ${username}
    input password    id=password     ${user_password}
    Click Button    name=login-button
    log    Username: ${username}, Password: ${user_password}
    location should be    https://www.saucedemo.com/inventory.html

Logout from Webpage
    click button    id:react-burger-menu-btn
    wait until element is visible    id:logout_sidebar_link
    click link    id:logout_sidebar_link
    log    Logged out from Webpage

Change Sorting Method
    [Arguments]    ${sorting_method}
    select from list by value    xpath://*[@id="header_container"]/div[2]/div/span/select    ${sorting_method}

Add Product to Cart
    [Arguments]    ${product_id}  ${product_price}    ${add_button_id}
    ${product_name}=    get text    xpath:${product_id}
    ${product_price}=    get text    xpath:${product_price}
    log    Product name: ${product_name}
    log    Product price: ${product_price}
    click button    id:add-to-cart-sauce-labs-backpack
    page should contain element    id:remove-sauce-labs-backpack