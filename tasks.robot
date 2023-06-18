*** Settings ***
Documentation       This suite contains all the test cases for the FBS website.

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



