#This feature contains sample data as input for RescheduleFeature.java

@Reschedule
Feature: RescheduleFeature
    As a Customer
    I want to reschedule a ticket on the FlightCenter
    So that I can book a flight with a different time

Background: User navigates to FlightCenter Reschedule page
    Given I am on reschedule page

Scenario: Successful reschedule
    When I select a valid Flight
    Then I should stay on the reschedule page

Scenario: Unsuccessful reschedule
    When I select a invalid Flight
    Then I should stay on the reschedule page