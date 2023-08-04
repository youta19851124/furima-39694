# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| price             | text       | null: false                    |
| payment_status_id | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
- has_many :item_orders
- belongs_to :user
- has_many :orders, through: :item_orders


## item_orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| order  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :order


## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| payment_amount | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :item_orders
- has_many :items, through: :item_orders