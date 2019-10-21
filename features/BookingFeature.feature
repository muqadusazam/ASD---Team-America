#This feature contains sample data as input for RescheduleFeature.java

@Booking
Feature: BookingFeature
    As a Customer
    I want to purchase a ticket on the FlightCenter
    So that I can book a flight

Background: User logs in and navigates to the flights page
    Given I enter in as "user@two.com" and "abcde1"
    Then I go on the "FC Flights" page on URL "https://arsproject.herokuapp.com/flights.jsp"

Scenario: Successful booking
    When I select a valid Flight
    Then I see my booking details
    Then I click the submit button
    Then I should see a message confirming successful booking

Scenario: Unsuccessful booking
    When I select a valid Flight
    Then I should see a message confirming unsuccessful booking
