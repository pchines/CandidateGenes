class Feature < ActiveRecord::Base
  attr_accessible :comment, :gene, :gene_id, :pubmed, :rating, :topic_id, :url
  belongs_to :gene
  belongs_to :topic

  def self.all_ratings
    return { 'Not assigned'  => 0,
      '1 No interest'        => 1,
      '2 Decreased interest' => 2,
      '3 Unchanged interest' => 3,
      '4 Increased interest' => 4,
      '5 High interest'      => 5,
      }
  end
end
