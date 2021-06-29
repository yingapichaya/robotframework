*** Settings ***
Documentation     A test suite on http://the-internet.herokuapp.com/login for KPC application process 
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
TC001 - Login success
    Given browser is opened to login page
    When user "${VALID USER}" logs in with password "${VALID PASSWORD}"
    Then secure page should be open
    Then logout

*** Keywords ***
Browser is opened to login page
    Open browser to login page

User "${username}" logs in with password "${password}"
    Input username    ${username}
    Input password    ${password}
    Submit credentials

Secure page should be open
    Page Should Contain     You logged into a secure area!


*** Test Cases ***
TC002 - Login failed - Password incorrect
    Given browser is opened to login page
    When user "${VALID USER}" logs in with password "${INVALID PASSWORD}"
    Then invalid password message should be shown

*** Keywords ***
Invalid Password Message Should Be Shown
    Page Should Contain     Your password is invalid!


*** Test Cases ***
TC003 - Login failed - Username not found
    Given browser is opened to login page
    When user "${INVALID USER}" logs in with password "${VALID PASSWORD}"
    Then invalid user message should be shown

*** Keywords ***
Invalid User Message Should Be Shown
    Page Should Contain     Your username is invalid!


*** Test Cases ***
TC004 - Login failed - Username and password are empty
    Given browser is opened to login page
    When user "${EMPTY}" logs in with password "${EMPTY}"
    Then invalid user message should be shown