class CreateSuggestionBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestion_books do |t|
      t.string :synopsis
      t.float :price
      t.string :author, null: false
      t.string :title, null: false
      t.string :link, null: false
      t.string :editor, null: false
      t.string :year, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
