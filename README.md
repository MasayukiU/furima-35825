## users テーブル

| Column              | Type          | Options          |
| ------------------- | ------------- | ---------------- |
| email               | string        | null: false      |
| password            | string        | null: false      |
| nickname            | string        | null: false      |
| last_name					  | string        | null: false      |
| first_name          | string        | null: false      |
| last_name_reading   | string        | null: false      |
| first_name_reading  | string        | null: false      |
| birthday            | string        | null: false      |

### Association
has_many :items
has_many :purchase_history
has_one :orders

## items テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| name                | string        | null: false       |
| Category            | string        | null: false       |
| price               | integer       | null: false       |
| seller              | text          | null: false       |
| brand               | string        | null: false       |
| item_condition      | text          | null: false       |
| shipping_charge     | integer       | null: false       |
| shipping_area       | integer       | null: false       |
| estimated_time      | integer       | null: false       |
| image               | references    | ActiveStorage     |
| product_description | text          | null: false       |
| user_id             | text          | foreign_key: true |

### Association
belongs_to :users
has_one :purchase_history
has_one :comments
has_one :favorite

## purchase_history  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| user_id             | text          | foreign_key: true |
| items_id            | text          | foreign_key: true |
| orders_id           | text          | foreign_key: true |

### Association
belongs_to :users
has_one :items
belongs_to :orders

## orders  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| postal_code         | string        | null: false       |
| prefecture          | integer       | null: false       |
| city                | integer       | null: false       |
| addresses           | integer       | null: false       |
| house_number        | integer       | null: false       |
| building_name       | integer       | null: false       |
| phone_number        | integer       | null: false       |
| credit_card         | integer       | unique: true      |

### Association
belongs_to :users
has_one :purchase_history

## comments  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| user_id             | text          | foreign_key: true |
| items_id            | text          | foreign_key: true |
| comment             | text          | null: false       |

### Association
belongs_to :users
belongs_to :items

## favorites  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| user_id             | text          | foreign_key: true |
| items_id            | text          | foreign_key: true |

### Association
belongs_to :users
belongs_to :items
