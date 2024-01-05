# furimaテーブル設計

##　usersテーブル
|Column            |Type  |Options                             |
|------------------|------|------------------------------------|
|nickname          |string|null: false                         |
|email             |string|null: false, unique: true           |
|encrypted_password|string|null: false                         |
|name_kanji        |string|null: false                         |
|name_kana         |string|null: false                         |
|birthdate         |string|null: false                         |

##　productsテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|product           |string     |null: false                   |
|description       |text       |null: false                   |
|user              |references |null: false, foreign_key: true|

##　commentsテーブル 
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|text              |text       |null: false                   |
|product           |references |null: false, foreign_key: true|
|user              |references |null: false, foreign_key: true|

##　purchasesテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|purchase_detail   |references |null: false                   |
|payment           |string     |null: false                   |
|user              |string     |null: false, foreign_key: true|

##　deliverysテーブル
|Column            |Type       |Options                       |
|------------------|-----------|------------------------------|
|post              |string     |null: false                   |
|prefectures       |string     |null: false                   |
|city              |string     |null: false                   |
|block             |string     |null: false                   |
|building_name     |string     |null: false                   |
|phone_number      |string     |null: false                   |

