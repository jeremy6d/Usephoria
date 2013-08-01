Given(/^there are (\d+) tests created$/) do |this_many|
  this_many.to_i.times do 
    visit clients_dashboard_path
    click_on "new-ab-test"
    fill_in "Title", with: Faker::Lorem.words.join
    fill_in "Question", with: Faker::Lorem.sentence
    attach_file "Image A", File.join(Rails.root, "spec", "media", "1.jpg")
    attach_file "Image B", File.join(Rails.root, "spec", "media", "2.jpg")
    click_on "Save"
  end
end