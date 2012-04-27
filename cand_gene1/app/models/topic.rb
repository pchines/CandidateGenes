class Topic < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :features
  acts_as_versioned

  def self.all_for_select
    return self.all.collect { |t| [t.name, t.id] }
  end
end
