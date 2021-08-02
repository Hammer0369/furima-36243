# Furima テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birth_year         | string     | null: false |
| birth_month        | string     | null: false |
| birthday           | string     | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              |            |             |
| name               | string     | null: false |
| info               | text       | null: false |
| category           | string     | null: false |
| status             | string     | null: false |
| shipping_fee       | string     | null: false |
| shipping_area      | string     | null: false |
| delivery_scheduled | string     | null: false |
| price              | integer    | null: false |
| user               | references | foreign_key |
| order              | references | foreign_key |

### Association

- belongs_to :item
- has_one    :shipping_address

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | foreign_key |
| item               | references | foreign_key |
| shipping_address   | references | foreign_key |

### Association

- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| addresses          | string     | null: false |
| building           | string     | null: false |
| phone_number       | string     | null: false |
| order              | references | foreign_key |

### Association

- belongs_to :order