FactoryBot.define do
  factory :user do
    name { "Oscar Someone" }
    email { "oscar@gmail.com" }
    password { "password" }
    password_confirmation { "password"}
  end
end
