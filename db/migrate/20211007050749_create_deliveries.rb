class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|

      t.string  :post_code,       null:false
      t.integer :todoufukenn_id,  null:false
      t.string  :city,            null:false
      t.string  :city_address,    null:false
      t.string  :building_name
      t.string  :phone_number,    null:false
      t.references :buy_items,    null:false, foreign_key: true

      t.timestamps
    end
  end
end
