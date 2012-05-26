class Variant < ActiveRecord::Base
  attr_accessible :dbsnp, :freq, :freq_finn, :function, :interest, :key, :nmi, :source
  belongs_to :gene
  acts_as_versioned
end
