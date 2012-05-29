class Variant < ActiveRecord::Base
  attr_accessible :dbsnp, :freq, :freq_finn, :function, :interest, :key, :nmi, :source, :validated
  belongs_to :gene
  acts_as_versioned

  @@validation_statuses = {
      0  => 'Not attempted',
      10 => 'Not valid',
      20 => 'Assay failed',
      30 => 'Other',
      40 => 'Partly valid',
      50 => 'Fully valid',
      }

  def self.all_validation_codes
    return @@validation_statuses.invert
  end

  def validation_status
    @@validation_statuses[self.validated]
  end
end
