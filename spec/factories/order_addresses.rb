FactoryBot.define do
  factory :order_address do
    postal_code           { '123-1234' }
    shipping_area_id      { 2 }
    city                  { '横浜市' }
    house_number          { '南青山1-1-1' }
    building_name         { 'コーポ273号室' }
    phone_number          { '09012341234' }
    token                 { "tok_abcdefghijk00000000000000000" }
  end
end
