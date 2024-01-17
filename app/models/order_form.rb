class OrderForm
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :block, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :post
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end
  
  validate :validate_post
  validate :phone_number_length

  def save

    Order.transaction do
      order = Order.create!(user_id: user_id, item_id: item_id, price: price)
      ShippingAddress.create(post: post, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  private

  def validate_post
    return if post.blank?

    unless post.match?(/\A\d{3}-\d{4}\z/)
      errors.add(:post, 'is invalid')
    end
  end

  def phone_number_length
    return if phone_number.blank?

    unless phone_number.match?(/\A\d{10,11}\z/)
      errors.add(:phone_number, 'is invalid')
    end
  end
end