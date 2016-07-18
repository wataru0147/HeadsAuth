class Product < ActiveRecord::Base
  belongs_to :brand

  scope :published, -> { where(published: true) }

  validates :brand_id, presence: true
  has_attached_file :product_image, styles: { large: "1200x550#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\Z/
end
