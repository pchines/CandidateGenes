class CreateVariants < ActiveRecord::Migration
  def up
    create_table :variants do |t|
      t.integer :gene_id
      t.string  :key
      t.string  :function
      t.string  :interest
      t.string  :nmi
      t.string  :dbsnp
      t.float   :freq
      t.float   :freq_finn
      t.string  :source

      t.timestamps
    end
    Variant.create_versioned_table
  end

  def down
    Variant.drop_versioned_table
    drop_table :variants
  end
end
