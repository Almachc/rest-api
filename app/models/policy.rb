class Policy < ApplicationRecord
  validates :effective_from, :effective_until, presence: true

  belongs_to :insured
  belongs_to :vehicle
end
