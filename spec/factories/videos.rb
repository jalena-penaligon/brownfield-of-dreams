FactoryBot.define do
  factory :video do
    title { Faker::Games::Pokemon.name }
    description { Faker::TvShows::SiliconValley.motto }
    video_id { Faker::Crypto.md5 }
    sequence(:position) { |n| ("#{n}".to_i+1)*2 }
    tutorial
  end
end
