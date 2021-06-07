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
has_many :purchase_histories


## items テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| item_name           | string        | null: false       |
| price               | integer       | null: false       |
| product_description | text          | null: false       |
| user                | references    | foreign_key: true |
| category_id         | integer       | null: false       |
| item_condition_id   | integer       | null: false       |
| shipping_area_id    | integer       | null: false       |
| shipping_charge_id  | integer       | null: false       |
| estimated_time_id   | integer       | null: false       |

### Association
belongs_to :user
has_one :purchase_history


## purchase_histories  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| user                | references    | foreign_key: true |
| item                | references    | foreign_key: true |

### Association
belongs_to :user
has_one :item
has_one :shipping_address


## shipping_addresses  テーブル

| Column              | Type          | Options           |
| ------------------- | ------------- | ----------------- |
| postal_code         | string        | null: false       |
| prefecture_id       | integer       | null: false       |
| city                | text          | null: false       |
| house_number        | text          | null: false       |
| building_name       | text          | null: false       |
| phone_number        | string        | null: false       |
| purchase history    | references    | foreign_key: true |


### Association
belongs_to :purchase_histories


