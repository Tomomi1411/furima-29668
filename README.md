# テーブル設計

## users テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| nickname               | string  | null: false |
| email                  | string  | null: false |
| encrypted_password     | string  | null: false |
| surname                | string  | null: false |
| name                   | string  | null: false |
| surname_kana           | string  | null: false |
| name_kana              | string  | null: false |
| birth                  | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| explanation   | text       | null: false                   |
| category      | integer    | null: false                   |
| condition     | integer    | null: false                   |
| pay_id        | integer    | null: false                   |
| area_id       | integer    | null: false                   |
| day_id        | integer    | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order   | references | null: false,foreign_key: true  |

### Association
- belongs_to :order

## orders テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| item   | references | null: false,foreign_key: true |
| user   | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address