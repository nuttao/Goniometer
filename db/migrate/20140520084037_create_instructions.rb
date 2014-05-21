class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.references :motion, index: true
      t.string :name
      t.text :description
      t.integer :axis_mode
      t.integer :order_no
      t.attachment :image

      t.timestamps
    end
  end
end
