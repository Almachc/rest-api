class Vehicle < ApplicationRecord
  validates :license_plate, :make, :model, :year, presence: true

  has_many :policies
end
