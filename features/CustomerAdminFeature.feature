@Customer_admin
Feature: CustomerAdminFeature
    As a Staff
    I want to create customer accounts
    So that I can add new customer to the database

Background: Staff navigates to FlightCenter Add Customer page
    Given I am on Add Customer page

Scenario: Successful registration
    When I fill in with "Customer" and "Test" and "cust@tester.com" and "abcde1" and "TT999" and "1992-12-12"
    Then I should see user_management page

Scenario Outline: Unsuccessful registration
    When I fill in "<firstname>" and "<lastname>" and "<email>" and "<password>" and "<passport>" and "<dob>"
    Then I should stay on userAdd_management page
    Examples:
        | firstname | lastname | email        | password | passport | dob        | warning                  |
        |           | One      | user@one.co  | qwert1   | UO001    | 1994-04-15 | Missing first name.      |
        | James     | Ten      | ben@ten.co   | qwert1   |          | 2000-01-01 | Missing password.        |
        | Donald    | Kid      | trump@gov.us |          | DT001    | 1950-11-13 | Missing passport number. |
        | Why       |          | dobby@do.b   | qwert1   | DD001    | 1960-12-28 | Missing last name.       | 
        | Test      | Name     | poo@head.aus | qwert1   | PH001    |            | Missing DOB.             |
