class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.date :start_date, null: false 
      t.date :end_date, null: false
      t.timestamps
  end
      add_index :rents, :user_id
      add_index :rents, :book_id
  end
end
