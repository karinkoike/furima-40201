# furimaテーブル設計

##　usersテーブル
|Column            |Type   |Options                             |
|------------------|-------|------------------------------------|
|nickname          |string |null: false                         |
|email             |string |null: false, unique: true           |
|encrypted_password|string |null: false                         |
|family_name       |string |null: false                         |
|last_name         |string |null: false                         |
|family_name_kana  |string |null: false                         |
|last_name_kana    |string |null: false                         |
|birthdate         |date   |null: false                         |

- has_many :purchase_histories
- has_many :items, through: :purchase_histories

##　itemsテーブル
|Column                   |Type       |Options                       |
|-------------------------|-----------|------------------------------|
|image                    |text       |null: false                   |
|item_name                |string     |null: false                   |
|item_description         |text       |null: false                   |
|category_id              |string     |null: false                   |
|item_state_id            |string     |null: false                   |
|delivery_charge_burden_id|string     |null: false                   |
|prefectures_id           |string     |null: false                   |
|delivery_date_id         |integer    |null: false                   |
|price                    |integer    |null: false                   |

- belongs_to :user
- has_one :purchase_history

##　purchase_historiesテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|item              |references |null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_many :deliveries

##　deliveriesテーブル
|Column            |Type        |Options                       |
|------------------|------------|------------------------------|
|post_id           |string      |null: false                   |
|prefectures_id    |string      |null: false                   |
|city              |string      |null: false                   |
|block_id          |string      |null: false                   |
|building_name     |string      |                              |
|phone_number_id   |string      |null: false                   |
|user              |references  |null: false, foreign_key: true|
|item              |references  |null: false, foreign_key: true|

- belongs_to :purchase_history