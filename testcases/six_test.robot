*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/resources_2.robot
Variables    ../resources/variables.py

*** Test Cases ***
My Six Test Case
    [Setup]    Open Chrome Without Password Popups    ${url}    ${browser_name}
    [Teardown]    Close Browser and log
    Login to Webpage    ${standard_user}    ${password}
    Add Product to Cart    //*[@id="item_4_title_link"]/div    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div    add-to-cart-sauce-labs-backpack
    Change Sorting Method    ${sort_hilo}
    Logout from Webpage