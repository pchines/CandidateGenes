class Gene < ActiveRecord::Base
  attr_accessible :user_id, :long_name, :summary, :symbol
  has_many :features
  has_many :aliases
  belongs_to :user
  acts_as_versioned

  def assigned_to
    if self.user_id > 0
	return self.user.username
    end
    return "not assigned"
  end

  def gene_aliases
    as = self.aliases
    if as.nil?
      return ''
    else
      return as.map { |a| a.gene_alias }.join(', ')
    end
  end

  def score
    fs = self.features
    if fs.nil?
      return 0
    else
      return 999
    end
  end
end
