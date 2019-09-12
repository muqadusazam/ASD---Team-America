# Login Feature
# language: en
@Login

Feature: LoginFeature
As a admin
I want to login into mLab account using my admin credentials
In order to connect to mLab cloud database

Background: User nevigates to mLab login page
Given I am on login page

Scenario: Successful login to mLab
When I fill in "Email" with "<mLab email>"
And I fill in "Password" with "<mLab Password>"
Then I should see "main.jsp" main page

Scenario Outline: Failed login to mLab using wrong credentials
When I fill in "Email" with "<email>"
And I fill in "Password" with "<Password>"
Then I should see "login.jsp" login page
Examples:
| username           | password     | warning                           |
      | Test         | !23          | Incorrect credentials. Try again. |
      | Test         |              | Please enter password.            |
      |              | 123          | Please enter username.            |
      |              |              | Please enter your credentials.    |