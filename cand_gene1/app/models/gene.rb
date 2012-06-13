class Gene < ActiveRecord::Base
  attr_accessible :user_id, :long_name, :summary, :symbol, :disease, :gene_info, :decision
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

  def calc_score
    fx = self.features.select('topic_id, avg(rating) as rating').where('rating > 0').group('topic_id')
    write_attribute(:topic_count, fx.length)
    score = 0.0
    if fx.length > 0
      fx.each { |f| score += f.rating }
      score /= fx.length
    end
    write_attribute(:score, score)
  end

  def gene_links
    return Lookup.find_all_by_category('gene_links').collect do |link|
      url = link.value
      if url.matches(/ENTREZ_ID/)
        if @entrez_id.nil?
          next
        end
        url.gsub!('ENTREZ_ID',@entrez_id.to_s)
      end
      url.gsub!('SYMBOL',@symbol)
      [link.item, url]
    end
  end

  def self.all_decisions
    return ['', 'Drop', 'Validate', 'Followup']
  end
end
