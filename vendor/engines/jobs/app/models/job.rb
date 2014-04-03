class Job < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true

  belongs_to :attachment, :class_name => 'Resource'

  scope :list, lambda { |limit|
    order("position ASC").limit(limit)
  }
end
