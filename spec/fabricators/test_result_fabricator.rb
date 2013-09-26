Fabricator(:test_result) do
  test_definition { Fabricate :ab_test }
  answer          { %w(A B).sample }
  comments        { Faker::Lorem.characters(141) }
  taker           { Fabricate :tester }
end