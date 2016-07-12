class Address < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates_presence_of :street, :city, :state, :zip
  validates :zip, length: { minimum: 5, maximum: 9 }
  validates :state, length: { minimum: 2, maximum: 2 }
end
