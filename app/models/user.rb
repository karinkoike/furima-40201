class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nickname, presence: true
   validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d).+\z/ }
   validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
   validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
   validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
   validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
   validates :birthdate, presence: true
end
