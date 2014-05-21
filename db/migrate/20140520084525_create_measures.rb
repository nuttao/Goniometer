class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.references :user, index: true
      t.integer :measure_mode
      t.references :patient, index: true
      t.text :description
      t.datetime :measured_at
      t.references :body_part, index: true
      t.references :motion, index: true
      t.float :value

      t.timestamps
    end
  end
end
