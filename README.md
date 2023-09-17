# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| nickname           | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| kana_last_name     | string | null: false              |
| kana_first_name    | string | null: false              |
| birth_date         | date   | null: false              |


### Association

-has_many :items
-has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| description           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| delivery_cost_id      | integer    | null: false                    |
| shipping_area_id      | integer    | null: false                    |
| shipping_lead_time_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false  foreign_key: true |

### Association

-belongs_to :user
-has_one  :order

## delivery_informations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false  foreign_key: true |

### Association

-belongs_to :order

## orders テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | references | null: false  foreign_key: true |
| user                 | references | null: false  foreign_key: true |

### Association

-belongs_to :item
-belongs_to :user
-has_one    :delivery_information