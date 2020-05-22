*** Settings ***
Resource        base.robot

*** Keywords ***

I access login page
    Go To                           https://bikelov.herokuapp.com/

I submit my credentials with "${email}"
    Input Text                      id:email                                    ${email}
    Click Element                   xpath://button[contains(text(),'Entrar')]   

The logged area should be displayed
    Page Should Contain Element     class:dashboard

I should view the alert message "${expected_message}"
    Element Text Should Be          class:alert-dark                            ${expected_message}
