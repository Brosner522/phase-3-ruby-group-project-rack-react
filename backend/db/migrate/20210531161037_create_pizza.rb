class CreatePizza < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name 
      t.string :image
      t.integer :price
      t.string :description
      t.integer :topping_id 
    end
  end
end
