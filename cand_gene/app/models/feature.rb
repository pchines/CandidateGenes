class Feature < ActiveRecord::Base
  belongs_to :gene
  belongs_to :topic
end
