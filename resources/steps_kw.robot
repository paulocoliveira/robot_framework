*** Settings ***
Resource        base.robot
Library         ./lib/mongo.py

*** Keywords ***

## login
I access login page
    Go To                           https://bikelov.herokuapp.com/

I submit my credentials with "${email}"
    Input Text                      ${INPUT_EMAIL}          ${email}
    Click Element                   ${LOGIN_BUTTON}                      

The logged area should be displayed
    Page Should Contain Element     ${DIV_DASH}

I should view the alert message "${expected_message}" in login screen
    Element Text Should Be          ${LOGIN_ALERT}          ${expected_message}

## Ads

I have a bike ${bike_string}
    ${bike_json}=                   evaluate                json.loads($bike_string)        json
    log                             ${bike_json}
    Set Test Variable               ${bike_json}
    Remove Bike                     ${bike_json['name']}

I access the ad screen
    Click Link                      /new

I create the bike ad
    Choose File                     ${INPUT_THUMB}          ${CURDIR}/images/${bike_json['thumb']}
    Clear Element Text              ${INPUT_NAME}           
    Input Text                      ${INPUT_NAME}           ${bike_json['name']}
    Clear Element Text              ${INPUT_BRAND}
    Input Text                      ${INPUT_BRAND}          ${bike_json['brand']}
    Clear Element Text              ${INPUT_PRICE}
    Input Text                      ${INPUT_PRICE}          ${bike_json['price']}
    Click Element                   ${AD_BUTTON}

I view my bike in ads list
    Wait Until Element Is Visible   ${BIKE_ITEM}
    Element Should Contain          ${BIKE_LIST}            ${bike_json['name']}

I verify rent cost is "${expected_price}"
    Element Should Contain          ${BIKE_LIST}            ${expected_price}

I should view the alert message "${expected_message}" in ad screen
    Element Text Should Be          ${AD_ALERT}             ${expected_message}