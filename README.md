# テーブル設計

## users テーブル

| Column             | Type   | Options            |
| ------------------ | ------ | ------------------ |
| email              | string | null: false UNIQUE |
| encrypted_password | string | null: false        |
| name               | string | null: false        |

### Association

-has_many :delivery_information
-has_many :items
-has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | string     | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| shipping_area      | string     | null: false                    |
| shipping_lead_time | string     | null: false                    |
| prise              | string     | null: false                    |
| user               | references | null: false  foreign_key: true |

### Association

-belong_to :user
-has_one  :order

## delivery_information テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false  foreign_key: true |

### Association

-belong_to :user
-has_one   :order

## orders テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| delivery_cost        | string     | null: false                    |
| delivery_information | references | null: false  foreign_key: true |
| user                 | references | null: false  foreign_key: true |
| user                 | references | null: false  foreign_key: true |

### Association

-belong_to :user
-belong_to :item
-belong_to :delivery_information