*** Settings ***
Documentation       This resource file contains keywords for operations on the FBS website.

Variables           variables.py
Library             RPA.Browser


*** Keywords ***
Example keyword
    Log    Today is ${TODAY}

Given I am on the FBS landing page
    Open Available Browser
    Go To               %{FBS_URL}
    Maximize Browser Window
    Sleep               1s

When I click on the "Terminal Trading" option
    Click Element       xpath=//a[contains(normalize-space(), 'Terminal trading')]
    Sleep               1s

Then I should see the different types of trading platforms
    Element Should Contain      xpath=//span[contains(normalize-space(), 'FBS Trader')]         FBS Trader
    Element Should Contain      xpath=//span[contains(normalize-space(), 'MetaTrader 4')]       MetaTrader 4
    Element Should Contain      xpath=//span[contains(normalize-space(), 'MetaTrader 5')]       MetaTrader 5
    Sleep               1s

When I scroll down to the section on application features
    Execute Javascript          document.querySelector('.trader-platform__instruments-list').scrollIntoView()
    Sleep               1s

Then I should be able to view the application features
    Page Should Contain         Pantau pasar dan buka order dalam beberapa ketukan
    Page Should Contain         Trading Forex, saham, kripto, logam, dan energi
    Page Should Contain         Deposit dan tarik dana 24/7 melalui 100+ metode pembayaran
    Page Should Contain         Nikmati dukungan dalam bahasa Indonesia, 24/7
    Sleep               1s