class Topic < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :feature
end
