class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.text :comment
      t.integer :rating
      t.integer :pubmed
      t.string :url

      t.timestamps
    end
  end
end
