sequence(:email) { |n| "user#{n}@example.com" }
  factory :user do
    email 
    password ...
    first_name 
    last_name "Example"
    admin false
  end

  factory :admin, class: User do
    email 
    password ...
    admin 
    first_name "Admin"
    last_name "User"
  end

