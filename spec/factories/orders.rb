FactoryBot.define do
  factory :order do
    postal_code         {'5570025'}
    prefecture_id       {40}
    municipality        {"浪速区"}
    address             {"青山1-1-1"}
    building_name       {"柳ビル"}
    phone_number        {'09050684705'}
    purchase_history    
  end
end
