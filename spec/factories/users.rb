FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '1' }
    password_confirmation { password }
    first_name            { '武田' }
    last_name             { '哲也' }
    first_name_kana       { 'タケダ' }
    last_name_kana        { 'テツヤ' }
    birthday do
      Date.new(1950, 10, 15)
    end
  end
end
