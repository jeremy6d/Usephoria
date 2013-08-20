Fabricator(:ab_test) do
  title { Faker::Lorem.words.join(" ") }
  email { Faker::Internet.email }
  user_goal 5
  author { Fabricate :client }
  question "Why is anything?"
end