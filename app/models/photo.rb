class Photo < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :image, styles: { medium: "400x400>", small: '200x200#', thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :description, presence: true
end
