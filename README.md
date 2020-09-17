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

- has_many :items, dependent::destroy
- has_many :purchases, dependent::destroy

## address テーブル

| Column           | Type       | Options                     |
| ---------------- | ---------- | --------------------------- |
| post_code        | string     | null:false                  |
| prefecture       | integer    | null:false                  |
| city             | string     | null:false                  |
| house_number     | string     | null:false                  |
| building_name    | string     |                             |
| phone_number     | string     | unique:true                 |
| order            | references | null:false, foreign_key:true                 |

### Association

- belongs_to: buyer

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| image           |            |                               |
| introduction    | text       | null: false                   |
| price           | integer    | null: false                   |
| condition       | integer    | null: false                   |
| postage_payer   | integer    | null: false                   |
| prefecture_code | integer    | null: false                   |
| preparation_day | integer    | null: false                   |
| category        | integer    | null: false                   |
| user            | references | null: false, foreign_key:true |

### Association

- has_many :comments, dependent::destroy
- belongs_to :user
- has_one :purchases

## order

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association
- belongs_to :user, dependent::destroy
- belongs_to :item, dependent::destroy
- has_one :sending_destinations