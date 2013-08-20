Given(/^(\w+)\s*(\w*) tests? have|has been created$/) do |this_many, type|
  this_many = "1" unless /\d/.match this_many
  this_many = this_many.to_i

  type = "AbTest" if type.nil? || type.blank?

  @client = sign_up_as! email: "client@here.com", role: "client"

  this_many.times { create_ab_test! }

  sign_out!
end

Given /^I create an? (\w*)\s?test$/ do |type|
  @created_test = create_ab_test!
end

Then /^I should( not)? see the test I created$/ do |negate|
  visit testers_dashboard_path

  if negate
    page.should_not have_content(@created_test.title)
  else
    page.should have_content(@created_test.title)
  end
end

Then /^the system should confirm successful test creation$/ do
  find("ul#flash li.notice").should have_content("A/B test successfully created.")
end

def create_ab_test!
  visit clients_dashboard_path
  find("a#new-ab-test").click
  fill_in "Title", with: Faker::Lorem.words.join
  fill_in "Question", with: Faker::Lorem.sentence
  attach_file "Image A", File.join(Rails.root, "spec", "media", "1.jpg")
  attach_file "Image B", File.join(Rails.root, "spec", "media", "2.jpg")
  click_on "Save"
  current_path.should == clients_ab_test_path(AbTest.last)
  step %Q(the system should confirm successful test creation)
  AbTest.last
end