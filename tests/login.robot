*** Settings ***
Documentation   Login
...             As an user that have an email
...             I want to start a new session
...             So that I have access to adds screen
Resource        ../resources/steps_kw.robot

Suite Setup         Start Session
Test Teardown       End Test
Suite Teardown      End Session


*** Test Cases ***
Verify that it is possible to login
    Given I access login page
    When I submit my credentials with "paulocol@gmail.com"
    Then The logged area should be displayed

Verify that it is not possible to login with an invalid email
    [Template]              Try to log in
    paulocolgmail.com       Oops. Informe um email válido!

Verify that it is not possible to login without email
    [Template]              Try to log in
    ${EMPTY}                Oops. Informe um email válido!

Verify that it is not possible to login with invalid caracters in email
    [Template]              Try to log in
    paulocol%gmail.com      Oops. Informe um email válido!

*** Keywords ***
Try to log in
    [Arguments]     ${email}        ${expected_message}
    I access login page
    I submit my credentials with "${email}"
    I should view the alert message "${expected_message}" in login screen
