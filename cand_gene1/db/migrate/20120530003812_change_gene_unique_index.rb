class ChangeGeneUniqueIndex < ActiveRecord::Migration
  def up
    remove_index :genes, :name => 'iu_genesymbol'
    add_index    :genes, [:symbol,:disease], :unique => true, :name => 'iu_symbol_disease'
  end

  def down
    remove_index :genes, :name => 'iu_symbol_disease'
    add_index    :genes, :symbol, :unique => true, :name => 'iu_genesymbol'
  end
end
