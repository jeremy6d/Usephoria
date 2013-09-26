Fabricator(:ab_test) do
  title { Faker::Lorem.words.join(" ") }
  active true
  author { Fabricate :client }
  question "Why is anything?"
  payout_in_cents 100
  balance_in_cents 1000
  fee_in_cents 50
end