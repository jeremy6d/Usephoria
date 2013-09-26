Then /^the flash (.*) message should be "(.*)"$/ do |type, msg|
  find("ul#flash li.#{type}").should have_content(msg)
end

def me
  @me
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should be on the (\w+) dashboard$/ do |role|
  current_path.should == eval(role + "s_dashboard_path")
end

Given /^I am on the tester dashboard$/ do
  be_on! testers_dashboard_path
  @payout = get_payout
end

When /^I (?:navigate to|visit|go to) the (\w+) dashboard$/ do |role|
  visit eval(role + "s_dashboard_path")
end

When /^I click on (.*)$/ do |label|
  click_on label
end

def be_on! path 
  unless current_path == path
    visit path 
  end
end

def get_payout
  page.find("span.test-payout").text.match(/[\d\.]+/)[0].to_f
end