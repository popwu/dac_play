Feature: Create Dice game, buy game chip and play game DICE
  As a regular user
  I have some fund
  I want to buy some game chip and play game DICE
  So that I might win or lose

  Background: Create an game and a asset accessible to that game
    Given I'm Alice
    And I received 5200000 XTS from angel
	 And I wait for one block
    And I print XTS balance
    And I created a game called dice
	 And I wait for one block
	 And I created a game asset called DICE for dice with precision 0.01, initial supply 10000, and inital collateral 1000
	 And I wait for one block

  Scenario: Buy game chip in the game and then play with it
  	 Given I'm Bob
  	 And I received 500 XTS from angel
  	 And I wait for one block
    When I buy for 10 DICE chip
    And I wait for one block
    And I print DICE balance
    Then Bob should have 10 DICE
    And I should have 499 XTS minus 1*fee
    When I play game dice using 10 DICE providing with 2 odds and 1 guess
    And I wait for one block
    Then Bob should have 0 DICE
    When I wait for 10 block
    Then I should win 20 DICE or lose
	 Then I should have 20 or 0 DICE
