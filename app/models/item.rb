class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :category_id , presence: true 
  validates :condition_id, presence: true
  validates :send_money_id, presence: true
  validates :todoufukenn_id, presence: true 
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  belongs_to :user
  # has_one :buy_item
  has_one_attached :image
  belongs_to :category_genre
  belongs_to :condition
  belongs_to :send_money
  belongs_to :todoufukenn
  belongs_to :delivery_day
end
