FactoryBot.define do
  factory :message do
    body { Faker::HowIMetYourMother.quote }
    mtype 0
    chat_room
    user
  end
end
