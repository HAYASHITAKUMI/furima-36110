FactoryBot.define do
  factory :purchase_residence do
    token                    {"tok_abcdefghijk00000000000000000"}
    postal_code              {'123-4567'}
    delivery_id              { 2 }
    municipality             {'横浜市緑区'}
    address                  {'青山1-1-1'}
    building_name            {'柳ビル103'}
    phone_number             {'09012345678'}
  end
end