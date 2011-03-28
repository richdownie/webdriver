@firefox @lineitems
Feature: UI Search Scenarios that require no data

Background:
Given I login with "rdownie@qamail1.rollstream.com"

Scenario: Cancel out of Save Search
	Given I am on the issues page
	And I click the "Save Search" link
	And I wait for "2" seconds
	And The Issues Save Search Name gets saved with "PING"
	And I click the "Cancel" button
	And I click the "Logout" link