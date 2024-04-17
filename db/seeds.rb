# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

insured = Insured.create(name: 'Homer Simpsons', document_number: '1234567891')
vehicle = Vehicle.create(license_plate: 'abc1234', make: 'chevrolet', model: 'camaro', year: '2024')
Policy.create(effective_from: DateTime.current, effective_until: DateTime.current + 1.year, insured: insured, vehicle: vehicle)

insured2 = Insured.create(name: 'Peter Griffin', document_number: '1234567892')
vehicle2 = Vehicle.create(license_plate: 'abc1235', make: 'chevrolet', model: 'camaro', year: '2024')
Policy.create(effective_from: DateTime.current, effective_until: DateTime.current + 1.year, insured: insured2, vehicle: vehicle2)
