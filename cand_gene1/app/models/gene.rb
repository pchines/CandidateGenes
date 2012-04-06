class Gene < ActiveRecord::Base
  attr_accessible :assigned_to, :long_name, :summary, :symbol
  has_many :feature
end
