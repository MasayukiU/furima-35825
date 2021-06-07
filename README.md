## users テーブル

| Column              | Type          | Options          |
| ------------------- | ------------- | ---------------- |
| email               | string        | unique: true     |
| encrypted_password  | string        | null: false      |
| nickname            | string        | null: false      |
| last_name					  | string        | null: false      |
| first_name          | string        | null: false      |
| last_name_reading   | string        | null: false      |
| first_name_reading  | string        | null: false      |
| birthday            | date          | null: false      |

### Association
has_many :items
has_many :purchase_historys


## items テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| name                | string        | null: false       |
| price               | integer       | null: false       |
| seller              | text          | null: false       |
| brand               | string        | null: false       |
| image               | references    | ActiveStorage     |
| product_description | text          | null: false       |
| user_id             | references    | foreign_key: true |
| Category_id         | integer       | null: false       |
| item_condition_id   | integer       | null: false       |
| shipping_area_id    | integer       | null: false       |
| shipping_charge_id  | integer       | null: false       |
| estimated_time_id   | integer       | null: false       |

### Association
belongs_to :user
has_one :purchase_history


## purchase_history  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| user_id             | references    | foreign_key: true |
| items_id            | references    | foreign_key: true |
| orders_id           | references    | foreign_key: true |

### Association
belongs_to :user
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


### Association
belongs_to :user
has_one :purchase_history


