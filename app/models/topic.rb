class Topic < ApplicationRecord
  has_many :blogs
  validates_presence_of :title

  # Custom scope for blog sidebar to show topics with posts
  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil, status: 'draft' })
  end
end
