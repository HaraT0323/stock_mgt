class CreateHistroys < ActiveRecord::Migration[5.2]
  def change
    create_table :histroys do |t|
      t.integer :product_id, null: false
      t.integer :user_id, null: false
      t.integer :number, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
