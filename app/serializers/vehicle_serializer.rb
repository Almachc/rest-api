class VehicleSerializer < ActiveModel::Serializer
  attributes :license_plate, :make, :model, :year
end
