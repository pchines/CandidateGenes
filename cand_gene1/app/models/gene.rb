class Gene < ActiveRecord::Base
  attr_accessible :user_id, :long_name, :summary, :symbol
  has_many :features
  belongs_to :user

  def assigned_to
    if self.user_id > 0
	return self.user.username
    end
    return "not assigned"
  end
end
