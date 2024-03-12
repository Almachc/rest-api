require 'sneakers'

Sneakers.configure(
  amqp: ENV['RABBITMQ_HOST'],
  log: STDOUT,
  workers: 1,
  threads: 1,
  prefetch: 1,
  environment: Rails.env
)

Sneakers.logger.level = Logger::INFO
