class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :token, null: false
      t.integer :rental_register_id
      t.timestamps null: false
    end
    add_index :users, :token, unique: true
    add_index :users, :rental_register_id
  end
end
