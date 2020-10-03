FactoryBot.define do
  factory :item do
    name              {"名前"}
    explanation       {"商品説明"}
    condition_id         {5}
    day_id            {2}
    price             {1000000}
    pay_id            {2}
    area_id           {40}
    category_id       {2}
    association :user
  end
end