*** Settings ***
Resource        base.robot
Library         ./lib/mongo.py

*** Keywords ***

## login
I access login page
    Go To                           https://bikelov.herokuapp.com/

I submit my credentials with "${email}"
    Input Text                      id:email                                    ${email}
    Click Element                   xpath://button[contains(text(),'Entrar')]   

The logged area should be displayed
    Page Should Contain Element     class:dashboard

I should view the alert message "${expected_message}"
    Element Text Should Be          class:alert-dark                            ${expected_message}

## Ads

I have a bike ${bike_string}
    ${bike_json}=                   evaluate    json.loads($bike_string)        json
    log                             ${bike_json}
    Set Test Variable               ${bike_json}
    Remove Bike                     ${bike_json['name']}

I create the bike ad
    Click Link                      /new
    Choose File                     css:#thumbnail input                        ${CURDIR}/images/${bike_json['thumb']}
    Input Text                      id:name                                     ${bike_json['name']}
    Input Text                      id:brand                                    ${bike_json['brand']}
    Input Text                      css:input[placeholder*='cobrado por dia']   ${bike_json['price']}
    Click Element                   class:btn-red

I view my bike in ads list
    Wait Until Element Is Visible   css:.bike-list li
    Element Should Contain          class:bike-list                             ${bike_json['name']}

I verify rent cost is "${expected_price}"
    Element Should Contain          class:bike-list                             ${expected_price}