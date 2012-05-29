class AddGenomeToVariant < ActiveRecord::Migration
  def change
    opt = { :default => "", :null => false }
    add_column :variants,         :genome, :string, opt
    add_column :variant_versions, :genome, :string, opt
  end
end
