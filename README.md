# テーブル設計

## users テーブル

| Column                 | Type    | Options     |
| ---------------------- | ------- | ----------- |
| nickname               | string  | null: false |
| email                  | string  | null: false |
| encrypted_password     | string  | null: false |
| surname                | string  | null: false |
| name                   | string  | null: false |
| surname(kana)          | string  | null: false |
| name(kana)             | string  | null: false |
| birth                  | date    | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :purchase_histories

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| explanation   | string     | null: false                   |
| category      | integer    | null: false                   |
| condition     | string     | null: false                   |
| pay_id        | integer    | null: false                   |
| area_id       | integer    | null: false                   |
| days_id       | integer    | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- has_one :purchase_history

## addresses テーブル

| Column          | Type       | Options      |
| --------------- | ---------- | ------------ |
| postal_code     | string     | null: false  |
| prefectures_id  | integer    | null: false  |
| municipality    | string     | null: false  |
| address         | string     | null: false  |
| building_name   | string     |              |
| phone_number    | string     | null: false  |
| user            | references | null: false,foreign_key: true  |

### Association
- belongs_to :item
- has_one :purchase_histories

## purchase_histories テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------------------------- |
| item   | references | null: false,foreign_key: true |
| user   | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address