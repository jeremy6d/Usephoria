When(/^I navigate to the tester dashboard$/) do
  visit testers_dashboard_path
end

Then(/^I should see (\d+) tests available$/) do |this_many|
  page.all(".tester-test").size.should == this_many.to_i
end