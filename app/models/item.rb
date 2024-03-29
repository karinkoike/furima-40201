class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_state
  belongs_to_active_hash :delivery_charge_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, in: 300..9999999 }
end
