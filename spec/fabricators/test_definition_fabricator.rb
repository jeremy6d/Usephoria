Fabricator(:test_definition) do
  title { Faker::Lorem.words }
  active true
  user_goal 15
  budget 300
end