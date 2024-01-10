FactoryBot.define do
  factory :user do
    nickname { 'TestUser' }
    email { Faker::Internet.email }
    password { '1a2b3c4d' }
    password_confirmation { '1a2b3c4d' }
    first_name { '太郎' }
    last_name { '山田' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthdate { '1990-01-01' }
  end
end
