FactoryBot.define do
  factory :order_address do
    zip_code { Faker::Number.between(from: 100, to: 999).to_s + '-' + Faker::Number.between(from: 1000, to: 9999).to_s }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    city { '名古屋市中村区' }
    street { '15-6' }
    building_name { '中村家' }
    phone_number { '0' + Faker::Number.between(from: 100_000_000, to: 9_999_999_999).to_s }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end