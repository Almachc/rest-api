class PolicySerializer < ActiveModel::Serializer
  attributes :id, :effective_from, :effective_until

  belongs_to :insured
  belongs_to :vehicle
end
