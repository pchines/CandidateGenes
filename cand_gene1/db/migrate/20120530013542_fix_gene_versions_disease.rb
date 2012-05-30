class FixGeneVersionsDisease < ActiveRecord::Migration
  def change
    add_column :gene_versions, :disease, :string
  end
end
