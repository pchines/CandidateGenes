class AddForeignKeysToFeatures < ActiveRecord::Migration
  def up
    change_table :features do |t|
      t.references :gene
      t.references :topic
    end
    add_index :features, [:gene_id, :topic_id], { :name => 'i_gene_topic' }
  end
  def down
    remove_index  :features, :name => 'i_gene_topic'
    remove_column :features, :gene_id
    remove_column :features, :topic_id
  end
end
