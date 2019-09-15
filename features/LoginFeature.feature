# Login Feature
# language: en
@Login

Feature: LoginFeature
    As a admin
    I want to login into mLab account using my credentials
    In order to connect to mLab cloud database

Background: User nevigates to login page
    Given I am on login page

Scenario: Successful login
    When I fill in with "user@one.com" and "abcde1"
    Then I should see main page

Scenario Outline: Unsuccessful login
    When I fill in with "<Email>" and "<Password>"
    Then I should stay on login page
    Examples:
    | Email           | Password     | Warning                           |
    | Test            | !23          | Incorrect credentials. Try again. |
    | Test            |              | Please enter password.            |
    |                 | 123          | Please enter username.            |
    |                 |              | Please enter your credentials.    |