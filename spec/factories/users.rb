FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    date_of_birth         { Faker::Date.birthday }
  end
end
