class Asset < ApplicationRecord
  belongs_to :post
  has_attached_file :image, styles: { big:"800x600#", medium: "300x300#", thumb: "100x100#" }
  
  validates_attachment :image, presence: true,
  content_type: { content_type: /\Aimage\/.*\z/ },
  size: { in: 0..5.megabytes }

  before_validation do 
    self.image.destroy if self._destroy == '1' 
  end

end
