Fabricator(:test_result) do
  test_definition
  answer { %w(A B).sample }
  comments { Faker::Lorem.characters(141) }
end
