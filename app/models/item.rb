class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :send_money_id, presence: true
  validates :todoufukenn_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :send_money_id, numericality: { other_than: 1 }
  validates :todoufukenn_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :buy_item
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :send_money
  belongs_to :todoufukenn
  belongs_to :delivery_day
end
