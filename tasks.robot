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

Sebagai user, saya dapat mengakses ke data pasar real-time di platform.
    Given I am on the FBS landing page
    When I click on the "Masuk" button
    And I fill in the login data     %{EMAIL}    %{PASS}
    And I click on the "Login" button
    Then I am taken to the dashboard
    When I click on the "Trading" button in progress
    And I click on "MT5 Web Terminal"
    # stuck at loading from here
    And I click on the "Accept" button
    And I click on the "Demo" button
    And I fill in the first name, last name, and email       %{EMAIL}       %{FN}      %{LN}
    And I click on the "Agree" checkbox
    And I click on the "Next" button
    And I click on the "Complete" button
    Then I can access the dashboard features
    And I can see real-time charts

Sebagai user, saya dapat risk management tools di platform.
    Given I am on the FBS landing page
    When I click on the "Masuk" button
    And I fill in the login data     %{EMAIL}    %{PASS}
    And I click on the "Login" button
    Then I am taken to the dashboard
    When I click on the "Trading" button in progress
    And I click on "MT5 Web Terminal"
    # stuck at loading from here
    When I click on the "Accept" button
    And I click on the "Demo" button
    And I fill in the first name, last name, and email       %{EMAIL}       %{FN}      %{LN}
    And I click on the "Agree" checkbox
    And I click on the "Next" button
    And I click on the "Complete" button
    Then I can access the dashboard features
    And I can see real-time charts
    When I click on "New Order"
    Then I can use the risk management tools

Sebagai user, saya dapat melakukan verifikasi dokumen.
    Given I am on the FBS landing page
    When I click on the "Masuk" button
    And I fill in the login data     %{EMAIL}    %{PASS}
    And I click on the "Login" button
    Then I am taken to the dashboard
    When I click on the "Verifikasi ID" option
    Then I am taken to the "Bukti Identitas" page

Sebagai user, saya menginginkan akses ke materi edukasi di platform.
    [Template]      I want access to a education material
    Buku panduan trading Forex
    Tips untuk trader
    Webinar
    Video pelajaran
    Seminar
    Glossary