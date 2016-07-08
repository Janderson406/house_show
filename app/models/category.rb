class Category < ActiveRecord::Base
  has_many :events

  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates_uniqueness_of :name

end
