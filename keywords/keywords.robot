*** Settings ***
Documentation       This resource file contains keywords for operations on the FBS website.

Variables           variables.py
Library             RPA.Browser


*** Keywords ***
Setup browser
    Open Available Browser
    Sleep               1s

Teardown browser
    Close Browser

Given I am on the FBS landing page
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

When I click on the "Trading" navbar
    Click Element       xpath=//a[@class='js-menu-link menu-lower__link' and text()='Trading']
    Sleep               1s

And I click on the "Akun Trading" option
    Click Element       xpath=//a[@class='light-link' and contains(normalize-space(), 'Akun trading')]
    Sleep               1s

Then the trading account information is displayed
    Page Should Contain Element     xpath=//h1[@class='inner-promo__title' and normalize-space(text())='Akun Trading']
    Sleep               1s

When I click on the "Deposit and Withdrawal" option
    Click Element       xpath=//a[contains(normalize-space(), 'Deposit dan penarikan dana')]
    Sleep               1s

Then I should be able to see pricing involved with transparency
    Page Should Contain Element    xpath=//h1[contains(@class, 'promo-title-h1') and contains(@class, 'promo-title-h2--centered') and normalize-space(text())='Deposit dan Trading dengan FBS']
    Sleep               1s

And I click on the "Spread" option
    Click Element       xpath=//a[@class='light-link' and text()='Spread']
    Sleep               1s
    
Then the spread information is displayed
    Page Should Contain Element    xpath=//p[@class='promo__caption' and normalize-space(text())='FBS menawarkan spread yang kecil untuk memberikan kebebasan trading']
    Sleep               1s

And I click on the "Margin dan Leverage" option
    Click Element       xpath=//a[@class='light-link' and text()='Margin dan Leverage']
    Sleep               1s

Then the margin and leverage information is displayed
    Page Should Contain Element    xpath=//h1[@class='inner-promo__title' and normalize-space(text())='Margin dan Leverage']
    Sleep               1s

When I click on the "Berita Perusahaan" option
    Click Element       xpath=//a[contains(normalize-space(), 'Berita perusahaan')]
    Sleep               1s

Then the berita perusahaan information is displayed
    Page Should Contain Element    xpath=//h1[@class='inner-promo__title' and normalize-space(text())='Berita Perusahaan FBS']
    Sleep               1s

Then I should be able to see the different types of trading instruments
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Forex']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Metals']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Indeks']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Energi']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Saham']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Forex Exotic']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Kripto']
    Sleep                           1s

When I click on the "${instrument}" trading instrument
    ${instrument_link}=    Set Variable    xpath=//a[contains(@class, 'light-link') and normalize-space()='${instrument}']
    Click Element           ${instrument_link}
    Sleep                   1s

# consistency failed, some variables has diffrent value from the title of the page
Then I should see the "${instrument}" types detail
    ${instrument_detail}=   Set Variable    xpath=//h1[@class='inner-promo__title' and contains(text(), '${instrument}')]
    Page Should Contain Element    ${instrument_detail}
    Sleep                          1s

I want access to a trading instrument
    [Arguments]    ${instrument}
    Given I am on the FBS landing page
    When I click on the "Trading" navbar
    Then I should be able to see the different types of trading instruments
    When I click on the "${instrument}" trading instrument
    Then I should see the "${instrument}" types detail