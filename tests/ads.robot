*** Settings ***
Documentation   Ads
...             As an advertiser
...             I want to create an ad
...             So that I can put bikes available for rent
Resource        ../resources/steps_kw.robot

Suite Setup     Start Session
Test Teardown   End Test
Suite Teardown  End Session

*** Test Cases ***
Verify that it is possible to ad a bike
    Given I am on ad page
    And 