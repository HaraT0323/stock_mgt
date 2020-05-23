class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :stock, null: false
      t.string :model_number, null: false

      t.timestamps
    end
    add_index :products, [:name, :model_number], unique: true
  end
  
end
