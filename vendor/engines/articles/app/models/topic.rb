class Topic < ActiveRecord::Base

  acts_as_indexed :fields => [:title]

  validates :title, :presence => true, :uniqueness => true
  
  has_many :articles, :class_name => 'Article'
  
  scope :by_title, lambda { |title|
    where(:title => title.to_s)
  }
  
  def to_s
    self.title
  end

  def self.topic_options
    Topic.all.each.map do
      |t| [t.title, t.id]
    end
  end
end
