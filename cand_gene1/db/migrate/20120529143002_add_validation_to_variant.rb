class AddValidationToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :validated, :integer, { :default => 0, :null => false }
  end
end
