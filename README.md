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

##　purchase_historyテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|user              |references |null: false, foreign_key: true|
|item              |references |null: false, foreign_key: true|

##　deliverysテーブル
|Column            |Type        |Options                       |
|------------------|------------|------------------------------|
|post_id           |integer     |null: false                   |
|prefectures       |string      |null: false                   |
|city              |string      |null: false                   |
|block_id          |integer     |null: false                   |
|building_name     |string      |                              |
|phone_number_id   |integer     |null: false                   |

