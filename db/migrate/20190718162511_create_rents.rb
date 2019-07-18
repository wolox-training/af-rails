class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.integer :user_id, null:false
      t.integer :book_id, null:false
      t.date :start_date 
      t.date :end_date
      t.timestamps
  end
  
      add_index :rents, :user_id
      add_index :rents, :book_id
    end
  end