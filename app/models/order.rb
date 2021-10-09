class Order
  include ActiveModel::Model
  attr_accessor :post_code, :todoufukenn_id, :city, :city_address, :building_name, :phone_number, :user_id, :item_id, :token
  with_options  presence: true do
  validates :city
  validates :city_address
  validates :phone_number, format: { with: /\A\d{10,11}\z/} 
  validates :post_code, format: { with:/\A\d{3}[-]\d{4}\z/ }
  validates :todoufukenn_id, numericality: { other_than: 1}
  validates :user_id
  validates :item_id
  validates :token
  end
  def save
    buy_item = BuyItem.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, todoufukenn_id: todoufukenn_id, city: city, city_address: city_address, building_name: building_name, phone_number: phone_number, buy_item_id: buy_item.id)
 end
end