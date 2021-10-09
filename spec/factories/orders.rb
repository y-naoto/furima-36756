FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000"}
    post_code         {"123-5678"}
    todoufukenn_id     {3}
    city              {"市町"}
    city_address      {"番地"}
    building_name     {"建物名"}
    phone_number      {"00000000000"}
  end
end