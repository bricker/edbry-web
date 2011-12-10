FactoryGirl.define do
  factory :user do
    name "Robert Paulson"
    email { "#{name.parameterize}@example.com" }
    password "secret"
  end
end