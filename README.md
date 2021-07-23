## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, unique: true      |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| burden_id        | integer    | null: false                    |
| delivery_id      | integer    | null: false                    |
| days_delivery_id | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase



## purchases テーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| user       | references  | null: false, foreign_key       |
| item       | references  | null: false, foreign_key       |

- belongs_to :user
- belongs_to :item
- has_one :residence

## residences テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key       |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| postal_code   | string     | null: false                    |
| delivery_id   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| building_name | string     |                                |

- belongs_to :purchase