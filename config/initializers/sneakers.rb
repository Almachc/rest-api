require 'sneakers'
require 'sneakers/runner'

Sneakers.configure(
  amqp: ENV['RABBITMQ_HOST'],
  daemonize: false,
  log: STDOUT,
  workers: 1,
  threads: 1,
  prefetch: 1,
  environment: Rails.env
)

Sneakers.logger.level = Logger::INFO

if defined?(Rails::Server)
  Rails.application.config.after_initialize do
    workers = [PolicyCreationRequestWorker]
    Sneakers::Runner.new(workers).run
  end
end
