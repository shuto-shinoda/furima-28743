# テーブル設計

## users テーブル

| Column           | Type   | Options                 |
| ---------------- | ------ | ----------------------- |
| name             | string | null: false             |
| email            | string | null: false             |
| password         | string | null:false, unique:true |
| first_name       | string | null:false              |
| second_name      | string | null:false              |
| first_name_kana  | string | null:false              |
| second_name_kana | string | null:false              |
| birth_date       | date   | null:false              |

- has_many :items, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :sending_destination, dependent: :destroy

## sending_destinations テーブル

| Column           | Type       | Options                     |
| ---------------- | ---------- | --------------------------- |
| post_code        | string     | null:false                  |
| prefecture       | integer    | null:false                  |
| city             | string     | null:false                  |
| house_number     | string     | null:false                  |
| building_name    | string     |                             |
| phone_number     | string     | unique:true                 |
| user             | references | null:false                  |
### Association

- belongs_to: purchase

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| image      |
| introduction    | text       | null: false                    |
| price           | integer    | null: false                    |
| brand           | text       | null: false                    |
| condition       | integer    | null: false, foreign_key:true  |
| postage_payer   | integer    | null: false, foreign_key:true  |
| prefecture_code | integer    | null: false                    |
| preparation_day | integer    | null: false, foreign_key:true  |
| category        | references | null: false, foreign_key:true  |

### Association

- has_many :comments, dependent::destroy
- belongs_to :category
- belongs_to :user

## purchase

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- has_one :users, dependent::destroy
- has_one :items, dependent::destroy
- has_one :sending_destinations