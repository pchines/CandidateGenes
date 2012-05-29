class CreateLookups < ActiveRecord::Migration
  def change
    create_table :lookups do |t|
      t.string :item,  { :null => false }
      t.string :value, { :default => '', :null => false }

      t.timestamps
    end
  end
end
