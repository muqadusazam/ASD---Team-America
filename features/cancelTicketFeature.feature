#This feature contains sample data as input for RegisterFeature.java

@cancelTicket
Feature: cancelTicketFeature
    As a Customer
    I want to cancel a ticket on FlightCentre
    So that I can cancel a booked flight

Background: User is logged in and navigates to FlightCenter Cancel Ticket page
    Given I log in as "user@eight.com" and "abcde1"
    Given I go to cancel ticket page

Scenario: Successful cancellation
    When I click cancel button of ticket
    Then I should see cancelTicketConfirm page when I accept confirmation

Scenario: Unsuccessful cancellation
    When I click cancel button of ticket
    Then I should stay on cancel ticket page when I dismiss confirmation
