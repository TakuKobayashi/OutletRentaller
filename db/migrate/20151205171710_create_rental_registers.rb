class CreateRentalRegisters < ActiveRecord::Migration
  def change
    create_table :rental_registers do |t|
      t.string :phone_number
      t.integer :state, null: false, default: 0
      t.string :token, null: false
      t.string :user_agent, null: false
      t.datetime :rental_finish_at
      t.timestamps null: false
    end
    add_index :rental_registers, :token, unique: true
    add_index :rental_registers, :user_agent
    add_index :rental_registers, :phone_number
    add_index :rental_registers, :rental_finish_at
  end
end
