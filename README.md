# テーブル設計

## users テーブル

| Column           | Type   | Options                 |
| ---------------- | ------ | ----------------------- |
| name             | string | null: false             |
| email            | string | null: false             |
| password         | string | null:false, unique:true |
| first_name       | string     | null:false |
| second_name      | string     | null:false |
| first_name_kana  | string     | null:false |
| second_name_kana | string     | null:false |
| birth_date       | date       | null:false |
| introduction     | text       |            |
| user             | references |            |

### Association

- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_one :sns_authentication, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- belongs_to :user

## sending_destinations テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| post_code        | string    | null:false                   |
| prefecture       | integer    | null:false                   |
| city             | string     | null:false                   |
| house_number     | string     | null:false                   |
| building_name    | string     |                              |
| phone_number     | string     | unique:true                  |
| user             | references | null:false, foreign_key:true |

### Association

- belongs_to: user

##  credit_cards テーブル

| Column      | Type   | Options                        |
| ----------- | ------ | ------------------------------ |
| user_id     | string | null: false, foreign_key: true |
| costomer_id | string | null: false, foreign_key: true |
| card_id     | string | null: failse                   |

### Association

- belongs_to: user

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| price           | integer    | null: false                    |
| brand           | text       | null: false                    |
| item_condition  | integer    | null: false, foreign_key:true  |
| postage_payer   | integer    | null: false, foreign_key:true  |
| seller          | references | null: false,foreign_key: true  |
| buyer           | references | foreign_key: true              |


### Association

- has_many :favorites, dependent::destroy
- has_many :item_imgs, dependent::destroy
- belongs_to :category
- belongs_to :user

## purchase

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| prefecture_code | integer    | null: false                    |
| preparation_day | integer    | null: false, foreign_key: true |
| category        | references | null: false, foreign_key: true |
| trading_status  | integer    |                                |

### Association

- belongs_to :buyer
