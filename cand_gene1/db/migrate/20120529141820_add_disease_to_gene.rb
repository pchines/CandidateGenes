class AddDiseaseToGene < ActiveRecord::Migration
  def change
    add_column :genes, :disease, :string, { :default => '', :null => false }
  end
end
