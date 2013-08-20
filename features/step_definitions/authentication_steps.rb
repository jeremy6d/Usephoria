Given /^I have a (.*) account$/ do |chosen_role|
  @me = sign_up_as! role: chosen_role
  sign_out!
end

Given /^I am not authenticated$/ do
  visit "/"
  sign_out!
end

Given(/^I am authenticated$/) do
  step "I sign in"
end

Then /^I should be on the sign in page$/ do
  current_path.should == new_user_session_path
end

When /^I sign in$/ do
  visit new_user_session_path
  within("form#new_user") do
    fill_in "Email", with: @me.email
    fill_in "Password", with: "testestest"
    click_on "Sign in"
  end

  current_path.should == (@me.is_a_client? ? clients_dashboard_path : testers_dashboard_path)
end

def my_password
  "testestest"
end

def sign_out!
  if page.has_selector? "a#sign-out-link"
    page.find("a#sign-out-link").click
  end
end

def sign_up_as! params
  attrs = Fabricate.attributes_for(:user).merge params

  visit new_user_registration_path

  fill_in "Email", with: Faker::Internet.email
  fill_in "Password", with: "testestest"
  fill_in "Password confirmation", with: "testestest"

  case attrs[:role]
  when "client"
    choose "I want to create tests"
  when "tester"
    choose "I want to take tests"
  end

  click_on "Sign up"

  current_path.should == root_path
  step %Q(the flash notice message should be "A message with a confirmation link has been sent to your email address. Please open the link to activate your account.")
  step %Q("#{User.last.email}" should receive an email)
  step %Q(I open the email)
  step %Q(I follow "confirm" in the email)

  User.last.tap do |u|
    u.confirmed_at = Time.now - 1.minute
  end
end