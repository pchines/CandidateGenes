class Variant < ActiveRecord::Base
  attr_accessible :dbsnp, :freq, :freq_finn, :function, :interest, :key, :nmi, :source, :validated
  belongs_to :gene
  acts_as_versioned

  def ucsc_link
    p = self.key.split(':')
    chrom = p[0]
    start = p[1].to_i - 1000
    if start < 0
       start = 0
    end
    varend = p[2].to_i - 1
    stop  = varend + 1000
    url = "http://genome.cit.nih.gov/cgi-bin/hgTracks?db=#{self.genome}&position=#{chrom}:#{start}-#{stop}&hgct_customText=track+name=variant+visibility=pack+color=255,0,0%0a#{chrom}+#{p[1].to_i}+#{varend}+#{self.key}"
    return url.html_safe
  end

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
