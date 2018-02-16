FactoryBot.define do
  factory :chat_room do
    title { Faker::Internet.domain_word }
    user
  end
end
