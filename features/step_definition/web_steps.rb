Given(/^I'm in home page$/) do
  visit '/'
end

When(/^I fill "(.*?)" with "(.*?)" and submit$/) do |what, with|
  fill_in what, :with => with
  submit_form "tform"
  follow_redirect!
end

Then(/^I should see "(.*?)"$/) do |value|
  assert_contain value
end

When(/^I visit "(.*?)"$/) do |url|
  visit url
end

Then(/^content-type must contain "(.*?)"$/) do |content_type|
  assert response.headers["Content-Type"].include? content_type
end
