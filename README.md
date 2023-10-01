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

## items テーブル
| Column               | Type              | Options                        |
| -------------------- | ----------------- | ------------------------------ |
| product_name         | string            | null: false                    |
| product_description  | text              | null: false                    |
| category_id          | integer           | null: false                    |
| product_condition_id | integer           | null: false                    |
| shipping_fee_id      | integer           | null: false                    |
| prefecture_id        | integer           | null: false                    |
| shipping_time_id     | integer           | null: false                    |
| price                | integer           | null: false,                   |
| user                 | references        | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル
| Column              | Type              | Options                        |
| ------------------- | ----------------- | ------------------------------ |
| user                | references        | null: false, foreign_key: true |
| item                | references        | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :shipping_address

## Shipping Address テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| locality            | string     | null: false                    |
| street_address      | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| purchase            | references | null: false, foreign_key: true |

### Association
has_one :purchase