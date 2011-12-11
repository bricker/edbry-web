FactoryGirl.define do
  factory :user do
    name "Ron Swanson"
    email { "#{name.parameterize}@example.com" }
    password "secret"
  end
  
  factory :post do
    association :user, factory: 'user', name: "Tom Haverford"
    title "Blog Post"
    content "Lorem Ipsum"
  end
end