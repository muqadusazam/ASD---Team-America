#This feature contains sample data as input for RegisterFeature.java

@Register
Feature: RegisterFeature
    As a Customer
    I want to register an account on the FlightCenter
    So that I can book flights

Background: User navigates to FlightCenter Register page
    Given I am on register page

Scenario: Successful registration
    When I fill in with "Test" and "Tester" and "test@tester.com" and "abcde1" and "TT999" and "1992-12-12"
    Then I should see registerSuccess page

Scenario Outline: Unsuccessful registration
    When I fill in with "<firstname>" and "<lastname>" and "<email>" and "<password>" and "<passport>" and "<dob>"
    Then I should stay on register page
    Examples:
        | firstname | lastname | email        | password | passport | dob        | warning                  |
        |           | One      | user@one.co  | abcde1   | UO001    | 1994-04-15 | Missing first name.      |
        | Ben       | Ten      | ben@ten.co   | abcde1   |          | 2000-01-01 | Missing password.        |
        | Donald    | Trump    | trump@gov.us |          | DT001    | 1950-11-13 | Missing passport number. |
        | Dobby     |          | dobby@do.b   | abcde1   | DD001    | 1960-12-28 | Missing last name.       | 
        | Poo       | Head     | poo@head.aus | abcde1   | PH001    |            | Missing DOB.             |
