# furimaテーブル設計

##　usersテーブル
|Column            |Type   |Options                             |
|------------------|-------|------------------------------------|
|nickname          |string |null: false                         |
|email             |string |null: false, unique: true           |
|encrypted_password|string |null: false                         |
|first_name        |string |null: false                         |
|last_name         |string |null: false                         |
|first_name_kana   |string |null: false                         |
|last_name_kana    |string |null: false                         |
|birthdate         |date   |null: false                         |

- has_many :purchase_histories
- has_many :items

##　itemsテーブル
|Column                     |Type       |Options                       |
|---------------------------|-----------|------------------------------|
|item_name                  |string     |null: false                   |
|item_description           |text       |null: false                   |
|category_id                |integer    |null: false                   |
|item_state_id              |integer    |null: false                   |
|delivery_charge_burden_id  |integer    |null: false                   |
|prefecture_id              |integer    |null: false                   |
|delivery_date_id           |integer    |null: false                   |
|price                      |integer    |null: false                   |
|user                       |references |null: false, foreign_key: true|

- belongs_to :user
- has_one :purchase_history

##　purchase_historiesテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|item              |references |null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item
- has_one :delivery

##　deliveriesテーブル
|Column            |Type        |Options                       |
|------------------|------------|------------------------------|
|post              |string      |null: false                   |
|prefecture_id     |integer     |null: false                   |
|city              |string      |null: false                   |
|block             |string      |null: false                   |
|building_name     |string      |                              |
|phone_number      |string      |null: false                   |
|purchase_history  |references  |null: false, foreign_key: true|

- belongs_to :purchase_history