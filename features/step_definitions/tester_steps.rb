Then(/^I should see (\d+) tests available$/) do |this_many|
  page.all(".tester-test").size.should == this_many.to_i
end

Then /^I should( not)? see the test I just took$/ do |negate|
  visit testers_dashboard_path

  within("#tests") do
    if negate
      page.should_not have_content(@taken_test.title)
    else
      page.should have_content(@taken_test.title)
    end
  end
end

Then /^I should( not)? see( \d+)? tests I have( not)? taken$/ do |negate_see, num, negate_author|
  conditionally = negate_see ? "should_not" : "should"

  num.blank? || num.nil? ? count = nil : count = num.to_i
  counter = 0

  if negate_author 
    me.tests_not_taken.each do |test|
      page.send conditionally, have_content(test.title)
      counter += 1
    end
  else
    me.tests_taken.each do |test|
      page.send conditionally, have_content(test.title)
      counter += 1
    end
  end
  
  assert_equal counter, count, "wrong number of tests" if count
end

Given /^I note the tests taken count$/ do
  visit testers_dashboard_path unless current_path == testers_dashboard_path
  @test_taken_count = page.find("span#tests-taken").text.to_i
end

Then /^I should see the tests taken count incremented$/ do
  page.find("span#tests-taken").text.to_i.should == @test_taken_count + 1
end

Then /^the system confirms the test was taken$/ do
  find("ul#flash").should have_content("Thank you for taking the test!")
end

When /^I take the first A\/B test I see$/ do
  be_on! testers_dashboard_path
  raise "no ab test found" unless element = all(".abtest").first
  element.find("a.take-test-link").click
  @taken_test = AbTest.find current_path.split("/").last
  take_ab_test!
end

def take_ab_test!
  @choice = %w(A B).sample
  @comments = Faker::Lorem.characters(140)
  choose "I like this version (#{@choice})"
  fill_in "Give us your thoughts!", with: @comments
  click_on "Submit your answer!"
  step "the system confirms the test was taken"
end