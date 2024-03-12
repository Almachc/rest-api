class PolicyCreationRequestWorker
  include Sneakers::Worker
  from_queue :policy_creation_request,
             routing_key: ['policy_creation_requested']

  def work(message)
    parsed_message = JSON.parse(message, symbolize_names: true)

    ActiveRecord::Base.transaction do
      insured = Insured.create!(
        name: parsed_message.dig(:insured, :name),
        document_number: parsed_message.dig(:insured, :document_number)
      )

      vehicle = Vehicle.create!(
        license_plate: parsed_message.dig(:vehicle, :license_plate),
        make: parsed_message.dig(:vehicle, :make),
        model: parsed_message.dig(:vehicle, :model),
        year: parsed_message.dig(:vehicle, :year)
      )

      Policy.create!(
        effective_from: parsed_message[:effective_from],
        effective_until: parsed_message[:effective_until],
        insured: insured,
        vehicle: vehicle
      )

      ack!
    end
  end
end
