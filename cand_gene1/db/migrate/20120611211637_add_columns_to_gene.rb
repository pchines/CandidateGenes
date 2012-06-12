class AddColumnsToGene < ActiveRecord::Migration
  def change
    opt_s = { :default => "", :null => false }
    opt_n = { :default => 0,  :null => false }
    add_column :genes,            :decision, :string, opt_s
    add_column :gene_versions,    :decision, :string, opt_s
    rename_column :genes,         :summary, :gene_info
    rename_column :gene_versions, :summary, :gene_info
    add_column :genes,            :summary, :text
    add_column :gene_versions,    :summary, :text
    add_column :genes,            :score, :float, opt_n
    add_column :gene_versions,    :score, :float, opt_n
    add_column :genes,            :topic_count, :integer, opt_n
    add_column :gene_versions,    :topic_count, :integer, opt_n
    Gene.find(:all).each do |g|
      g.calc_score
      g.save!
    end
  end
end
