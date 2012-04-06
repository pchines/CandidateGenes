class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :gene_id
      t.integer :topic_id
      t.string :url
      t.integer :pubmed
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
