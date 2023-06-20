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
    Page Should Contain    Deposit dan Trading dengan FBS
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
    Sleep                   1s

When I click on the "${instrument}" trading instrument
    ${instrument_link}=    Set Variable    xpath=//a[contains(@class, 'light-link') and normalize-space()='${instrument}']
    Click Element           ${instrument_link}
    Sleep                   1s

# consistency failed, some variables has a diffrent value from the title of the page
Then I should see the "${instrument}" types detail
    ${instrument_detail}=   Set Variable    xpath=//h1[@class='inner-promo__title' and contains(text(), '${instrument}')]
    Page Should Contain Element    ${instrument_detail}
    Sleep                   1s

I want access to a trading instrument
    [Arguments]    ${instrument}
    Given I am on the FBS landing page
    When I click on the "Trading" navbar
    Then I should be able to see the different types of trading instruments
    When I click on the "${instrument}" trading instrument
    Then I should see the "${instrument}" types detail

When I click on the "Masuk" button
    Click Element    xpath=//a[@class='menu-button menu-button--login' and normalize-space()='Masuk']
    Sleep                   5s

Check If User Is Logged In
    ${status}    ${value}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    xpath=//h1[normalize-space()='Dashboard']    timeout=10s
    ${is_logged_in}=    Convert To Boolean    ${status == 'PASS'}
    [Return]    ${is_logged_in}

And I fill in the login data
    [Arguments]    ${email}    ${password}
    ${is_logged_in}=    Check If User Is Logged In
    Run Keyword Unless    ${is_logged_in}    Fill Login Data    ${email}    ${password}

Fill Login Data
    [Arguments]    ${email}    ${password}
    Input Text    id=email    ${email}
    Input Text    id=password    ${password}
    Sleep                   1s

And I click on the "Login" button
    ${is_logged_in}=    Check If User Is Logged In
    Run Keyword Unless    ${is_logged_in}    Perform Login

Perform Login
    Click Element    xpath=//button[@type='submit']
    Sleep    1s

Then I am taken to the dashboard
    Wait Until Page Contains Element    xpath=//h1[normalize-space()='Dashboard']    timeout=10s
    Sleep                   1s
    
When I click on the "Trading" button in progress
    Click Element    xpath=/html/body/personal-area-root/div/div/div/main/main-layout/div/app-shell/global-dashboard-page/grid/div/div[2]/div/div/new-verification-progress/div[2]/ul/li[3]/span
    Sleep                   1s

And I click on "MT5 Web Terminal"
    Click Element    xpath=//a[contains(@href, 'fbs.com/site/web-trader')]
    Sleep                   1s

# stuck at loading
And I click on the "Accept" button
    Wait Until Page Contains Element    id=accept    timeout=10s
    Click Element    id=accept
    Sleep                   1s

And I click on the "Demo" button
    Click Element    xpath=//button[contains(@title, 'Open a Demo Account')]
    Sleep                   1s

And I fill in the first name, last name, and email
    [Arguments]    ${email}    ${fn}    ${ln}
    Input Text    id=account-first-name    ${fn}
    Input Text    id=account-second-name    ${ln}
    Input Text    id=account-email    ${email}
    Sleep                   1s

And I click on the "Agree" checkbox
    Click Element    id=account-accept
    Sleep                   1s

And I click on the "Next" button
    Click Element    xpath=//button[@class='input-button' and contains(text(), 'Next')]
    Sleep                   1s

And I click on the "Complete" button
    Click Element    xpath=//button[@class='input-button' and contains(text(), 'Complete')]
    Sleep                   1s

Then I can access the dashboard features
    Page Should Contain Element    xpath=//div[contains(text(), 'Market Watch')]
    Sleep                   1s

And I can see real-time charts
    Page Should Contain Element    xpath=//div[@class='page-chart grid']
    Sleep                   1s


When I click on the "Verifikasi ID" option
    Click Element       xpath=/html/body/personal-area-root/div/div/div/main/main-layout/div/app-shell/global-dashboard-page/grid/div/div[1]/div/app-verify-widget/div/div[2]/btn/button
    Sleep                   1s

Then I am taken to the "Bukti Identitas" page
    Page Should Contain         Mengapa memverifikasi KTP?
    Sleep                   1s

I want access to a education material
    [Arguments]    ${material}
    Given I am on the FBS landing page
    When I click on the "Analisis dan Pendidikan" navbar
    Then I should be able to see the different types of material
    When I click on the "${material}" choice
    Then I should see the "${material}" detail

When I click on the "Analisis dan Pendidikan" navbar
    Click Element       xpath=/html/body/header/div[2]/div/div/div[2]/div[4]/a/span
    Sleep                   1s

Then I should be able to see the different types of material
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Buku panduan trading Forex']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Tips untuk trader']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Webinar']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Video pelajaran']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Seminar']
    Page Should Contain Element     xpath=//a[contains(@class, 'light-link') and normalize-space()='Glossary']
    Sleep                   1s

When I click on the "${material}" choice
    ${material_link}=    Set Variable    xpath=//a[contains(@class, 'light-link') and normalize-space()='${material}']
    Click Element           ${material_link}
    Sleep                   1s

# consistency failed, some variables has a diffrent value from the title of the page
Then I should see the "${material}" detail
    ${material_detail}=   Set Variable    xpath=//h1[@class='inner-promo__title' and contains(text(), '${material}')]
    Page Should Contain Element    ${material_detail}
    Sleep                   1s