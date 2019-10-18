#This feature contains sample data as input for RescheduleFeature.java
@Search_customer
Feature: SearchCustomerFeature.feature
    As a Staff
    I want to search for customer
    So I can find the customer faster

Background: Staff Navigates to FlightCenter User Management page
    Given I log in as "admin@one.com" and "abcde1"
    Then I go to User Management page

Scenario: Valid search result
    When I fill in "William"
    Then I should see user management page with user William

Scenario: Invalid search result
    When I fill in "$%&#^AKSDJ"
    Then I should see error message for invalid search result
