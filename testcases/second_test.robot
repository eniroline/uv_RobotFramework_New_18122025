*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://thetestingworld.com/testings/
${BROWSER}    Chrome

*** Test Cases ***
My Second Test Case
    OPEN BROWSER    ${URL}    ${BROWSER}
    maximize browser window
    select radio button    add_type    office
    select checkbox    name:terms
    click link    xpath://*[@id="tab-content1"]/form/div/em/a
    Sleep           5
    Close Browser