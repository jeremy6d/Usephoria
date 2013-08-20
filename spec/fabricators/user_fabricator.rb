Fabricator :user do
  email { Faker::Internet.email }
  password "testestest"
  password_confirmation "testestest"
  confirmed_at { Time.now - 1.year }
end

%w(tester client admin).each do |role|
  Fabricator role.to_sym, from: :user do
    role role
  end
end

Fabricator :unconfirmed_user, from: :user do
  confirmed_at nil
end