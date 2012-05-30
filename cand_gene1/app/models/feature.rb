class Feature < ActiveRecord::Base
  attr_accessible :comment, :gene, :gene_id, :pubmed, :rating, :topic_id, :url, :user_id, :author
  belongs_to :gene
  belongs_to :topic
  belongs_to :user
  acts_as_versioned

  def self.all_ratings
    return { 'Not assigned'  => 0,
      '1 No interest'        => 1,
      '2 Decreased interest' => 2,
      '3 Unchanged interest' => 3,
      '4 Increased interest' => 4,
      '5 High interest'      => 5,
      }
  end

  def self.ordered_for_gene(gene_id)
    return self.find_by_sql("select f.* from features f inner join topics t on t.id = f.topic_id where gene_id = #{gene_id} order by t.display_order")
  end
end
