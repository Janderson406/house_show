class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:host, :artist, :admin]

  has_many :events
  has_one :address
  has_one :profile

  accepts_nested_attributes_for :address

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: { medium: "300x300>", micro: '35x35#', thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/




end
