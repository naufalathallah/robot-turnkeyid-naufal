*** Settings ***
Documentation       This suite contains all the test cases for the FBS website.
Suite Setup         Setup browser
Suite Teardown      Teardown browser
Library             Collections
Library             MyLibrary
Library             Gherkin
Resource            keywords.robot
Variables           variables.py


*** Test Cases ***
Sebagai user, saya dapat mendapatkan informasi yang jelas dan transparan tentang proses perdagangan.
    Given I am on the FBS landing page
    When I click on the "Terminal Trading" option
    Then I should see the different types of trading platforms
    When I scroll down to the section on application features
    Then I should be able to view the application features

Sebagai user, saya dapat mendapatkan detail yang jelas tentang jenis-jenis akun.
    Given I am on the FBS landing page
    When I click on the "Trading" navbar
    And I click on the "Akun Trading" option
    Then the trading account information is displayed

Sebagai user, saya dapat melihat biaya-biaya yang terlibat dengan transparansi.
    Given I am on the FBS landing page
    When I click on the "Deposit and Withdrawal" option
    Then I should be able to see pricing involved with transparency

Sebagai user, saya dapat mendapatkan informasi secara transparan tentang spread dalam perdagangan.
    Given I am on the FBS landing page
    When I click on the "Trading" navbar
    And I click on the "Spread" option
    Then the spread information is displayed

Sebagai user, saya dapat mendapatkan informasi dengan jelas tentang leverage yang tersedia.
    Given I am on the FBS landing page
    When I click on the "Trading" navbar
    And I click on the "Margin dan Leverage" option
    Then the margin and leverage information is displayed

Sebagai user, saya dapat mendapatkan informasi lengkap tentang kondisi perdagangan lainnya.
    Given I am on the FBS landing page
    When I click on the "Berita Perusahaan" option
    Then the berita perusahaan information is displayed

Sebagai user, saya menginginkan akses ke berbagai pasangan mata uang Forex di platform.
    [Template]      I want access to a trading instrument
    Forex
    Metals
    Indeks
    Energi
    Saham
    Forex Exotic
    Kripto
