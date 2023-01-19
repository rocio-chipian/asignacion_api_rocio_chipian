class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :image
      t.decimal :price
      t.string :currency
      t.integer :quantity

      t.timestamps
    end
  end
end
