#MLab FlightList Feature
Feature:FlightList Feature
As a Customer/Staff
I want to view the list of all the available flights
except for duplicated data

Background: Customer clicked flight tab 
Given I am on flight list page

Scenario: Succesfully display the list of all the flights 
When I clicked flight tab
Then I should see all the available flights in the form of table

Scenario Outline: Duplicated data existed in the database
When There is duplicated data
Then the duplicated data should be removed from database

