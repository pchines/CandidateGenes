class Disease < ActiveRecord::Base
  attr_accessible :description, :disease, :prevalence, :prevalence_finn
  def self.list_all
    return self.find(:all, :order => 'disease').collect { |d| d.disease }
  end
end
