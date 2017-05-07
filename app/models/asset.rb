class Asset < ApplicationRecord
  # attr_accessor :_destroy
  belongs_to :post
  has_attached_file :image, styles: { medium: "400x600#", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  before_validation do 
    self.image.destroy if self._destroy == '1' 
  end

end
