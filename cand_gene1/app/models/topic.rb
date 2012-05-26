class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :display_order
  has_many :features
  acts_as_versioned

  def self.all_for_select
    return self.find(:all, :order => 'display_order').collect do |t|
      [t.name, t.id]
    end
  end

  def self.next_order_no
    new_id = maximum(:id)
    if new_id.nil?
       new_id = 1
    else
       new_id += 1
    end
    return new_id
  end
end
