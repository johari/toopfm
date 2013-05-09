Given(/^I'm in home page$/) do
  visit '/'
end

When(/^I fill "(.*?)" with "(.*?)" and submit$/) do |what, with|
  fill_in what, :with => with
  submit_form "tform"
end

Then(/^I should see "(.*?)"$/) do |value|
  contain value
end
