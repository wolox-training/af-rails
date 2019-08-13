class ChangeColumnBookTitleWithLimitation < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :title, :string, limit: 25, null: false
  end
end
