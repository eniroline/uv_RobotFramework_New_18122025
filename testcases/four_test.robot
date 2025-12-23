*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome

# Users
${StandardUser}    standard_user
${LockedOutUser}    locked_out_user

${Password}    secret_sauce

*** Test Cases ***
My Fours Test Case
    Open browser and maximize    ${URL}    ${BROWSER}
    Login To Website Saucedemo    ${StandardUser}    ${Password}
    set screenshot directory    ../screenshots
    wait until element is visible    xpath://*[@id="page_wrapper"]/footer/ul/li[2]/a
    capture page screenshot
    capture element screenshot    xpath://*[@id="page_wrapper"]/footer/ul/li[2]/a
    ${Title}=    get title
    log    Page title is: ${Title}
    ${Cookies}=    get cookies
    log    ${Cookies}
    Sleep    5
    element should contain    class:footer_copy     Sauce Labs. All Rights Reserved. Terms of Service | Privacy Policy
    go back
    sleep    3
    Close Browser