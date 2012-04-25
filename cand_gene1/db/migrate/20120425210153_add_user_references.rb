class AddUserReferences < ActiveRecord::Migration
  def up
    add_column :features, :user_id, :integer, { :default => 0, :null => false }
    add_column :genes,    :user_id, :integer, { :default => 0, :null => false }
    remove_column :genes, :assigned_to
  end

  def down
    remove_column :features, :user_id
    remove_column :genes,    :user_id
    add_column :genes, :assigned_to, :integer, { :default => 0, :null => false }
  end
end
