FactoryBot.define do
  factory :user do
    nickname { 'sannpul' }
    email { Faker::Internet.free_email }
    password { 'kimura11' }
    password_confirmation { 'kimura11' }
    firstname_kannji { '木村' }
    lastname_kannji { '拓哉' }
    firstname_katakana { 'キムラ' }
    lastname_katakana { 'タクヤ' }
    birthday { '1990-4-17' }
  end
end
