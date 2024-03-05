class Insured < ApplicationRecord
  validates :name, :document_number, presence: true

  has_many :policies
end
