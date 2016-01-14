
FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'password'
  end

  factory :admin, class: User do
    email 'admin@admin.com'
    password 'password'
  end
end
