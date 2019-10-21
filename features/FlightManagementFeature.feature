# Flight Search Feature
# language: en
@FlightManagement

Feature: FlightManagementFeature
  As a Staff
  I want to View the list of flights by destination
  So that I can check list of flights in database. 

  Background: Staff has navigated to the flights management page
    Given I log "admin@one.com" and "abcde1"
    Given I am on the flights management page

  Scenario: Search query meets requirements
    When I click Add flight button
    Then I should be loaded to flightAdd_management page

Scenario Outline: Input values are invalid type
   When I fill in the departure time with wrong format
    Then I should return to Addflights page
    Examples:
    | destination   | warning     |
    | 123   | Time must be hh:mm am/pm format   |
    | !@3   | Time must be hh:mm am/pm format |
    | Seo!  | Time must be hh:mm am/pm format  |
    | sydn3y    | Time must be hh:mm am/pm format |
<<<<<<< HEAD
=======
  
>>>>>>> 5262b153f67253f21409e4857932180bdaa13ff4
