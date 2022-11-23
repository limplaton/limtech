FactoryBot.define do
  factory :message do
    employee { nil }
    room { nil }
    content { "MyText" }
  end
end
