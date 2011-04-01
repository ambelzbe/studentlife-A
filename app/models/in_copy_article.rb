class InCopyArticle < ActiveRecord::Base
  belongs_to :article
  
  validates :article, :presence => true
  
  def self.for_article(article)
    where(:article_id => article.id).first || new(:article => article)
  end
  
  def to_incopy
    revision = article.revisions.latest.first
    Workflow::InCopy.markup_to_incopy revision.body, :header => header
  end
  
  def parse(incopy)
    self.header = Workflow::InCopy.extract_headers incopy
    Revision.new(
      :article => article,
      :body => Workflow::InCopy.incopy_to_markup(incopy)
    )
  end
end