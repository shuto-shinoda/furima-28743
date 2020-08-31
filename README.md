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
| introduction     | text   |                         |

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
| item_image      |
| introduction    | text       | null: false                    |
| price           | integer    | null: false                    |
| brand           | text       | null: false                    |
| item_condition  | integer    | null: false, foreign_key:true  |
| postage_payer   | integer    | null: false, foreign_key:true  |

### Association

- has_many :comments, dependent::destroy
- has_many :favorites, dependent::destroy
- belongs_to :category
- belongs_to :user

## purchase

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :users, dependent::destroy
- belongs_to :items, dependent::destroy
- has_many :sending_destinations