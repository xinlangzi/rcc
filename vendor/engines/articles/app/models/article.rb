class Article < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :content]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :topic
  
  scope :list, lambda{ |limit|
    order("created_at DESC").limit(limit)
  }
  
  def to_s
    self.title
  end
end
