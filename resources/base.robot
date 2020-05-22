*** Settings ***

Library     SeleniumLibrary

*** Variables ***
${BASE_URL}     https://bikelov.herokuapp.com/

*** Keywords ***

Start Session
    Open Browser                    about:blank              chrome
    Set Selenium Implicit Wait      5

End Session
    Close Browser

End Test
    Capture Page Screenshot