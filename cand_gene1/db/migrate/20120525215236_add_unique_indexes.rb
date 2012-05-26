class AddUniqueIndexes < ActiveRecord::Migration
  def up
    remove_index :users, :column => 'username'
    add_index    :users, :username, :unique => true, :name => 'iu_username'
    add_index   :topics, :name,     :unique => true, :name => 'iu_topicname'
    add_index    :genes, :symbol,   :unique => true, :name => 'iu_genesymbol'
  end

  def down
    remove_index :genes,  :name => 'iu_genesymbol'
    remove_index :users,  :name => 'iu_username'
    remove_index :topics, :name => 'iu_topicname'
    add_index    :users,  :username
  end
end
