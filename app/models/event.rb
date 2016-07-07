class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  enum status: [:pending, :accepted, :denied]
end
