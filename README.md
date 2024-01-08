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
|date              |integer|null: false                         |

- has_many :purchase_histories
- has_many :items, through: :purchase_histories
- has_many :deliverys

##　itemsテーブル
|Column                |Type       |Options                       |
|----------------------|-----------|------------------------------|
|item                  |string     |null: false                   |
|payment               |string     |null: false                   |
|seller                |string     |null: false                   |
|category              |string     |null: false                   |
|product_state         |string     |null: false                   |
|delivery_charge_burden|string     |null: false                   |
|delivery_source_area  |string     |null: false                   |
|delivery_date         |integer    |null: false                   |
|user                  |references |null: false, foreign_key: true|

- belongs_to :user
- has_many :purchase_histories
- has_many :users, through: :purchase_histories

##　purchase_historysテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|item              |references |null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item

##　deliverysテーブル
|Column            |Type        |Options                       |
|------------------|------------|------------------------------|
|post_id           |integer     |null: false                   |
|prefectures       |string      |null: false                   |
|city              |string      |null: false                   |
|block_id          |integer     |null: false                   |
|building_name     |string      |                              |
|phone_number_id   |integer     |null: false                   |

- belongs_to :user