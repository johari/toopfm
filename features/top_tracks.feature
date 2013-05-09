Feature: Listing feature
  In order to enjoy most awesome works of an artist
  As a user
  I want to see top tracks of a given artist

  Scenario: Show top tracks
    Given I'm in home page
    When I fill "artist" with "Pink Floyd" and submit
    Then I should see "Wish You Were Here"
