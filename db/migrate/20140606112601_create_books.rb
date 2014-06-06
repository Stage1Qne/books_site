class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :name, :null => false
      t.string  :series, :null => false
      t.string  :publisher, :null => false
      t.integer :year, :null => false
      t.integer :pages, :null => false
      t.string  :binding, :null => false
      t.string  :format, :null => false
      t.string  :isbn, :null => false
      t.integer :weight, :null => false
      t.text    :decription, :null => false
      t.integer :author_id

      t.timestamps
    end
  end
end
