class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_one :address

  enum status: [:pending, :accepted, :denied]


end
