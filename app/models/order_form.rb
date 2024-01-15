class OrderForm
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :post, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { in: 10..11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  validate :phone_number_length

  def save
    item = Item.find(item_id)
    self.price = item.price
    item.update!(sold_out: true)
    
    return false unless valid?

    Order.transaction do
      order = Order.create!(user_id: user_id, item_id: item_id, price: price)
      ShippingAddress.create(post: post, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def phone_number_length
    return if phone_number.blank?

    unless phone_number.length == 10 || phone_number.length == 11
      errors.add(:phone_number, "Phone number must be 10 or 11 digits")
    end
  end
end