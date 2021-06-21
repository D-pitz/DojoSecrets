FactoryBot.define do
  factory :secret do
    content { "MyString" }
    likes { "" }
    user { nil }
  end
end
