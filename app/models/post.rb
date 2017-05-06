class Post < ApplicationRecord
  has_many :assets


  def self.types
    %w(news article service)
  end
end
