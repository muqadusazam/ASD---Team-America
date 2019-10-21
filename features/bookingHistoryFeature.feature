# Flight Search Feature
# language: en
@BookingHistory

Feature: BookingHistorySearchFeature
  As a Customer
  I want to Search flight list using the search bar
  So that I can find a specific flight that matches my criteria

  Background: User has navigated to the booking history page
    Given log in "user@eight.com" and "abcde1"
    Given I am on the booking history page
    

  Scenario: Search query meets requirements
    When I fill in departure with "London"
    Then I should see booking_History_Results page

Scenario Outline: Search query does not meet requirement
   When I fill in departure with "<departure>"
    Then I should return to booking history page
    Examples:
    | departure   | warning                                                 |
    | 123         | Departure cannot contain numbers or special characters  |
    | !2%         | Departure cannot contain numbers or special characters  |
    | hjk!        | Departure cannot contain numbers or special characters  |
    | S2eoul      | Departure cannot contain numbers or special characters  |
