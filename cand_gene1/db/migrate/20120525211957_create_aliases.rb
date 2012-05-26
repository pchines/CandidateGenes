class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.integer :gene_id
      t.string  :gene_alias
      t.string  :source

      t.timestamps
    end
  end
end
