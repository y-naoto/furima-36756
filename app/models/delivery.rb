class Delivery < ApplicationRecord
  # validates :post_code,       presence: true
  # validates :todoufukenn_id,  presence: true
  # validates :city,            presence: true
  # validates :city_address,    presence: true
  # validates :building_name,
  # validates :phone_number,    presence: true

  belongs_to :buy_item
end
