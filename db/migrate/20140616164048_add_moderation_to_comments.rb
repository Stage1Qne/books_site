class AddModerationToComments < ActiveRecord::Migration
  def up
    add_column :comments, :moderated, :boolean, default: false
  end

  def down
    remove_column :comments, :moderated
  end
end
