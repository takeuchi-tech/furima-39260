## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

has_many :items
has_many :purchases
has_one :shipping_address


## items テーブル
| Column              | Type              | Options                        |
| ------------------- | ----------------- | ------------------------------ |
| product_name        | string            | null: false                    |
| product_description | text              | null: false                    |
| category            | string            | null: false                    |
| product_condition   | string            | null: false                    |
| shipping_fee        | numeric           | null: false                    |
| origin_address      | string            | null: false                    |
| shipping_time       | string            | null: false                    |
| price               | numeric           | null: false,                   |
| seller_user_id      | references :users | null: false, foreign_key: true |


### Association

belongs_to :user
has_one :purchase

## purchases テーブル
| Column              | Type              | Options                        |
| ------------------- | ----------------- | ------------------------------ |
| buyer_user_id       | references :users | null: false, foreign_key: true |
| item_id             | references        | null: false, foreign_key: true |
| shipping_address    | references        | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
belongs_to :shipping_address

## Shipping Address テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture          | string     | null: false                    |
| locality            | string     | null: false                    |
| street_address      | string     | null: false                    |
| building_name       | string     | null: false                    |
| phone_number        | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| purchase_id         | references | null: false, foreign_key: true |

### Association
has_one :purchase
belongs_to :user
