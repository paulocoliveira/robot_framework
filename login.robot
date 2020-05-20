*** Settings ***
Documentation   Login
...             As an user that have an email
...             I want to start a new session
...             So that I have access to adds screen
Library         SeleniumLibrary



*** Test Cases ***
Verify that it is possible to login
    Given I access the website
    When I submit my credentials with "paulocol@gmail.com"
    Then the logged area should be displayed
    And I logout from website

Verify that it is not possible to login with an invalid email
    Given I access the website
    When I submit my credentials with "paulocol&gmail.com"
    Then the alert message "Oops. Informe um email válido!" should be displayed
    And I logout from website

Verify that it is not possible to login without email
    Given I access the website
    When I submit my credentials with "${EMPTY}"
    Then the alert message "Oops. Informe um email válido!" should be displayed
    And I logout from website

*** Keywords ***
Given I access the website
    Open Browser                    https://bikelov.herokuapp.com/              chrome
    Set Selenium Implicit Wait      5
When I submit my credentials with "${email}"
    Input Text                      id:email                                    ${email}
    Click Element                   xpath://button[contains(text(),'Entrar')]   
Then the logged area should be displayed
    Page Should Contain Element     class:dashboard

Then the alert message "${expected_message}" should be displayed
    Element Text Should Be          class:alert-dark                            ${expected_message}

And I logout from website
    Close Browser
