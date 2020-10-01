FactoryBot.define do
  factory :user do
    nickname {"Tomomi"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
    surname {"眞邊"}
    name {"智己"}
    surname_kana{"マナベ"}
    name_kana{"トモミ"}
    birth{'1994-05-31'}
  end
end