*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources.robot

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    Chrome

# Users
${StandardUser}    standard_user
${LockedOutUser}    locked_out_user
${IncorrectUser}    incorrect_standard_user

${Password}    secret_sauce

*** Test Cases ***
My Fours Test Case
    Open Chrome Without Password Popups    ${URL}    ${BROWSER}
    Login To Website Saucedemo    ${IncorrectUser}    ${Password}
    page should contain element    class:error-message-container
    sleep    3
    Close Browser