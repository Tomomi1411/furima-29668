* Database initialization
# テーブル設計

## users テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| nickname               | string  | null: false |
| email                  | string  | null: false |
| password               | integer | null: false |
| password(confirmation) | integer | null: false |
| name                   | string  | null: false |
| name(kana)             | string  | null: false |
| birth                  | integer | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :purchase_histories

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| explanation   | string     | null: false                   |
| category      | string     | null: false                   |
| condition     | string     | null: false                   |
| pay_id        | integer    | null: false                   |
| area_id       | integer    | null: false                   |
| days_id       | integer    | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- has_one :purchase_histories

## addresses テーブル

| Column           | Type       | Options      |
| ---------------- | ---------- | ------------ |
| Postal_code      | integer    | null: false  |
| Prefectures_id   | integer    | null: false  |
| Municipality     | string     | null: false  |
| address          | string     | null: false  |
| Building_name    | string     |              |
| phone_number     | integer    | null: false  |

### Association
- belongs_to :item

## purchase_histories テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------------------------- |
| item    | references | null: false,foreign_key: true |
| user_id | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item