class AddColumnsToVariant < ActiveRecord::Migration
  def change
    opt_s = { :default => "", :null => false }
    rename_column :variant_versions, :key, :var_key
    rename_column :variants,         :key, :var_key
    rename_column :variant_versions, :function, :var_func
    rename_column :variants,         :function, :var_func
    add_column    :variant_versions, :gdna, :string, opt_s
    add_column    :variants,         :gdna, :string, opt_s
    add_column    :variant_versions, :freq_source, :string, opt_s
    add_column    :variants,         :freq_source, :string, opt_s
    add_column    :variant_versions, :freq_finn_source, :string, opt_s
    add_column    :variants,         :freq_finn_source, :string, opt_s
  end
end
