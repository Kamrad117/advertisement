class Post < ApplicationRecord
  has_many :assets, dependent: :destroy
  validates_associated :assets 
  accepts_nested_attributes_for :assets, allow_destroy: true

  def self.post_types
    %w(news article service)
  end

  def self.news 
    Post.where(post_type: 'news')
  end

  def self.article 
    Post.where(post_type: 'article')
  end

  def self.service 
    Post.where(post_type: 'service')
  end
end
