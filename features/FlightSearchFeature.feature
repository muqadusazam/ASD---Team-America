# Flight Search Feature
# language: en
@FlightSearch

Feature: FlightSearchFeature
  As a Customer
  I want to sort the list of flights by destination
  So that I can narrow down the list of flights to my criteria

  Background: User has navigated to the flights page
    Given I am on the flights page

  Scenario: Search query meets requirements
    When I fill in with "Seoul"
    Then I should see flights_searchResults page

Scenario Outline: Search query does not meet requirement
   When I fill in with "<destination>"
    Then I should return to flights page
    Examples:
    | destination   | warning     |
    | 123   | Destination cannot contain numbers or special characters    |
    | !@3   | Destination cannot contain numbers or special characters  |
    | Seo!  | Destination cannot contain numbers or special characters  |
    | sydn3y    | Destination cannot contain numbers or special characters  |
    

