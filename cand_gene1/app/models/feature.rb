class Feature < ActiveRecord::Base
  attr_accessible :comment, :gene, :gene_id, :pubmed, :rating, :topic_id, :url, :user_id, :author
  belongs_to :gene
  belongs_to :topic
  belongs_to :user
  acts_as_versioned
  after_save :update_gene_score
  after_destroy :update_gene_score

  def self.all_ratings
    return { 'Not assigned'  => 0,
      '1 No interest'        => 1,
      '2 Decreased interest' => 2,
      '3 Unchanged interest' => 3,
      '4 Increased interest' => 4,
      '5 High interest'      => 5,
      }
  end

  def self.ordered_for_gene(gene_id)
    return self.find_by_sql("select f.* from features f inner join topics t on t.id = f.topic_id where gene_id = #{gene_id} order by t.display_order")
  end

  def update_gene_score
    g = self.gene
    g.calc_score
    g.save!
  end

  def pubmed_url
    if self.pubmed.nil?
      return ''
    else
      return "http://eutils.ncbi.nlm.nih.gov/entrez/eutils/elink.fcgi?dbfrom=pubmed&id=#{self.pubmed}&retmode=ref&cmd=prlinks"
    end
  end

  def url=(url)
    if url.nil?
      clean = ''
    else
      clean = url.sub(/^\s+/,'')
    end
    if !clean.empty?
      if !clean.match(/^(ftp|http|https):\/\//)
        clean = 'http://' + clean
      end
    end
    write_attribute(:url, clean)
  end
end
