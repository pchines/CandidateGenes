class AddIndexToFeatures < ActiveRecord::Migration
  def change
    add_index :features, [:gene_id, :topic_id], { :name => 'i_gene_topic' }
  end
end
