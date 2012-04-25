class User < ActiveRecord::Base
  attr_accessible :fullname, :is_admin, :username
  has_many :feature
  has_many :gene

  def self.all_for_select
    sel = self.all.collect { |u| [u.username, u.id] }
    sel.unshift ["not assigned", 0]
    return sel
  end
end
