class Gene < ActiveRecord::Base
  attr_accessible :user_id, :long_name, :summary, :symbol
  has_many :features
  has_many :aliases
  has_many :variants
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
    if @score.nil?
      fx = self.features.select('topic_id, avg(rating) as rating').where('rating > 0').group('topic_id')
      @topic_count = fx.length
      @score = 0.0
      if @topic_count > 0
        fx.collect { |f| @score += f.rating }
        @score /= @topic_count
      end
    end
    return @score
  end

  def topic_count
    if @topic_count.nil?
      self.score
    end
    return @topic_count
  end
end
