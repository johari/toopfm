Feature: Listing in text format
  In order to process text output with unix CLI
  As a hard-core unix hacker
  I want to get top tracks in text format

  Scenario: Show top tracks in text format
  When I visit "/txt/coldplay"
  Then content-type must be "text/plain"
