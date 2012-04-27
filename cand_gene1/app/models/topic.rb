class Topic < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :features
  acts_as_versioned table_name: :topic_versions

  def self.all_for_select
    return self.all.collect { |t| [t.name, t.id] }
  end
end
