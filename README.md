## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false                    |
| product_name | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |

### Association
- belongs_to :users
- has_one :purchases



## purchases テーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| user       | references  | null: false, foreign_key       |
| item       | references  | null: false, foreign_key       |

- belongs_to :user
- belongs_to :item
- has_one :addresses

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| purchase     | references | null: false, foreign_key       |
| address      | string     | null: false                    |
| phone_number | string     | null: false                    |

- belongs_to :purchases