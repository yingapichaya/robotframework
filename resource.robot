*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}          Chrome
${DELAY}            0
${VALID USER}       tomsmith
${INVALID USER}     tomholland
${VALID PASSWORD}   SuperSecretPassword!
${INVALID PASSWORD}   Password!
${LOGIN URL}        http://the-internet.herokuapp.com/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    The Internet

Input Username
    [Arguments]     ${username}
    Input Text  username    ${username}

Input Password
    [Arguments]     ${password}
    Input Text  password    ${password}

Submit Credentials
    Click Button    Login

Logout
    Click Link      /logout
    Login Page Should Be Open
    Page Should Contain     You logged out of the secure area!