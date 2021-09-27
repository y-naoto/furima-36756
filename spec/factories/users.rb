FactoryBot.define do
  factory :user do
    nickname { 'sannpul' }
    email { '1234@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
    firstname_kannji { '木村' }
    lastname_kannji { '拓哉' }
    firstname_katakana { 'キムラ' }
    lastname_katakana { 'タクヤ' }
    birthday { '1990-4-17' }
  end
end