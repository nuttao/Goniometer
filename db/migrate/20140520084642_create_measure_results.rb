class CreateMeasureResults < ActiveRecord::Migration
  def change
    create_table :measure_results do |t|
      t.references :measure, index: true
      t.integer :order_no
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
