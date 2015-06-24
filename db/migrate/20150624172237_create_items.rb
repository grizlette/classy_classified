class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_name
      t.decimal :item_price
      t.text :item_description
      t.string :seller_name
      t.string :seller_phone_number
      t.string :seller_email
      t.string :seller_location
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
