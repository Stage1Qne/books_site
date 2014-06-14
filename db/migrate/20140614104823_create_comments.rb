class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :book
      t.string :email, :null => false
      t.string :full_name, :null => false
      t.text :content, :null => false

      t.timestamps
    end
      add_index :comments, :book_id
  end
end
