class AddTopicOrder < ActiveRecord::Migration
  def up
    opt = { :default => 0, :null => false }
    add_column :topics,         :display_order, :integer, opt
    add_column :topic_versions, :display_order, :integer, opt
  end

  def down
    remove_column :topics,         :display_order
    remove_column :topic_versions, :display_order
  end
end
