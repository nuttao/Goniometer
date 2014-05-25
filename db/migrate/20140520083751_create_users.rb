class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :email
      t.references :role, index: true
      t.attachment :image

      t.timestamps
    end
  end
end
