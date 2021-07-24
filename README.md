# テーブル設計


## users テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_date      | integer | null: false |

## Association
- has_many :items
- has_one :purchases


## items テーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_description | text       | null: false       |
| item_category    | string     | null: false       |
| item_status      | string     | null: false       |
| shipping_cost    | string     | null: false       |
| shipment_source  | string     | null: false       |
| shipping_days    | string     | null: false       |
| price            | integer    | null: false       |
| user_id          | references | foreign_key: true |

## Association
- belongs_to :user
- has_one :purchases


## purchases テーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| card_number      | integer    | null: false       |
| exp_month        | integer    | null: false       |
| exp_year         | integer    | null: false       |
| card_cvc         | integer    | null: false       |
| zip_code         | integer    | null: false       |
| prefecture       | string     | null: false       |
| municipalities   | string     | null: false       |
| street           | string     | null: false       |
| building_name    | string     | null: false       |
| phone_number     | integer    | null: false       |
| user_id          | references | foreign_key: true |
| item_id          | references | foreign_key: true |

## Association
- belongs_to user
- belongs_to item


