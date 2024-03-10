class PolicyCreationRequestWorker
  include Sneakers::Worker
  from_queue :policy_creation_request,
             routing_key: ['policy_creation_requested']

  def work(message)
    ActiveRecord::Base.transaction do
      insured = Insured.create!(name: message[:name], document_number: message[:document_number])

      vehicle = Vehicle.create!(
        license_plate: message[:license_plate],
        make: message[:make],
        model: message[:model],
        year: message[:year]
      )

      Policy.create!(
        effective_from: message[:effective_from],
        effective_until: message[:effective_until],
        insured: insured,
        vehicle: vehicle
      )

      ack!
    end
  end
end
