class CreateMotions < ActiveRecord::Migration
  def change
    create_table :motions do |t|
      t.references :body_part, index: true
      t.string :name
      t.attachment :image

      t.timestamps
    end
  end
end
