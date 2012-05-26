class Alias < ActiveRecord::Base
  attr_accessible :gene_alias, :gene_id, :source
  belongs_to :gene
end
