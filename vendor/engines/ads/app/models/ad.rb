class Ad < ActiveRecord::Base

  acts_as_indexed :fields => [:link]

  validates :link, :presence => true, :uniqueness => true
  validates :image, :presence => true
  
  belongs_to :image
  
  scope :list, lambda { |limit|
    order("position ASC").limit(limit)
  }
end
