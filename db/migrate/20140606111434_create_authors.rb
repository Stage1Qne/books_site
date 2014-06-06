class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :full_name, :null => false

      t.timestamps
    end
  end
end
