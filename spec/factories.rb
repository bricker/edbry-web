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
  
  factory :page do
    text_id "page_title"
    title "Page Title"
    content "Page Content"
  end
end