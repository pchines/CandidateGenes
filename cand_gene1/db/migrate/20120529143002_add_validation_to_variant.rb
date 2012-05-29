class AddValidationToVariant < ActiveRecord::Migration
  def change
    opt = { :default => 0, :null => false }
    add_column :variants,         :validated, :integer, opt
    add_column :variant_versions, :validated, :integer, opt
  end
end
