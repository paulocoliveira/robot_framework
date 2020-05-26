*** Settings ***
Documentation   Ads
...             As an advertiser
...             I want to create an ad
...             So that I can put bikes available for rent
Resource        ../resources/steps_kw.robot

Suite Setup     Run Keywords        Logged with "paulocol@gmail.com"
...             AND                 I access the ad screen
Test Setup      Reload Page
Test Teardown   End Test
Suite Teardown  End Session

*** Variables ***
${bike_ok}      {"thumb": "elleven.jpg", "name": "Eleven Rocker 26", "brand": "Shimano", "price": "15"}
${no_thumb}     {"thumb": "", "name": "Eleven Rocker 26", "brand": "Shimano", "price": "15"}
${no_name}      {"thumb": "elleven.jpg", "name": "", "brand": "Shimano", "price": "15"}
${no_brand}     {"thumb": "elleven.jpg", "name": "Eleven Rocker 26", "brand": "", "price": "15"}

*** Test Cases ***
#Verify that it is not possible to ad a bike without thumb
#    [Template]      Ad not registered
#    ${no_thumb}     Precisamos de uma foto para o seu anúncio!

Verify that it is not possible to ad a bike without name        
    [Template]      Ad not registered
    ${no_name}      Informe a descrição do anúncio!

Verify that it is not possible to ad a bike without brand       
    [Template]      Ad not registered
    ${no_brand}     Informe a marca da sua Bike :)

Verify that it is possible to ad a bike
    Given I have a bike ${bike_ok}
    When I create the bike ad
    Then I view my bike in ads list
    And I verify rent cost is "R$15/dia"

*** Keywords ***
Ad not registered           
    [Arguments]     ${bike}     ${expected_message}
    Given I have a bike ${bike}
    When I create the bike ad
    Then I should view the alert message "${expected_message}" in ad screen