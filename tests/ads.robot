*** Settings ***
Documentation   Ads
...             As an advertiser
...             I want to create an ad
...             So that I can put bikes available for rent
Resource        ../resources/steps_kw.robot

Suite Setup     Logged with "paulocol@gmail.com"
Test Teardown   End Test
Suite Teardown  End Session

*** Variables ***
${bike}         {"thumb": "elleven.jpg", "name": "Eleven Rocker 26", "brand": "Shimano", "price": "15"}

*** Test Cases ***
Verify that it is possible to ad a bike
    Given I have a bike ${bike}
    When I create the bike ad
    Then I view my bike in ads list

*** Keywords ***
