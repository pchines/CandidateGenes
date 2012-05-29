class Lookup < ActiveRecord::Base
  attr_accessible :item, :value

  def self.get(name)
    lv = Lookup.find_by_item(name)
    if lv.nil?
      return nil
    else
      return lv.value
    end
  end
end
