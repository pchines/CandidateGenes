class AddFeatureAuthor < ActiveRecord::Migration
  def up
    opt = { :default => "", :null => false }
    add_column :features,	  :author, :string, opt
    add_column :feature_versions, :author, :string, opt
  end

  def down
    remove_column :features,         :author
    remove_column :feature_versions, :author
  end
end
