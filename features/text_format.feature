Feature: Listing in text format
  In order to process text output with unix CLI
  As a hard-core unix hacker
  I want to get top tracks in text format

  Scenario: Show top tracks in text format
  When I visit "/txt/pink+floyd"
  Then content-type must contain "text/plain"
  And I should see "Wish You Were Here"
