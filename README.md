# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| address            | string | null: false               |
| birthday           | date   | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |

### Association

- has_many :items
- has_many :orders
- belongs_to :address


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| price               | decimal    | null: false                    |
| description         | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| details             | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shipping_fee_burden | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| shipping_duration   | string     | null: false                    |


### Association
- has_many :item_orders
- belongs_to :user
- has_many :orders, through: :item_orders
- has_many :addresses


## item_orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false                    |
| user   | references | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| street         | string     | null: false                    |
| building_name  | string     |                                |  
| phone_number   | integer    | null: false                    |  
| item_order     | references | null: false                    |
| user           | references | null: false                    |

### Association
- belongs_to :user
- belongs_to :item_orders


## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| payment_amount | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items, through: :item_orders
- has_many :addresses
