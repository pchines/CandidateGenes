class Feature < ActiveRecord::Base
  attr_accessible :comment, :gene_id, :pubmed, :rating, :topic_id, :url
  belongs_to :gene
  belongs_to :topic
end
