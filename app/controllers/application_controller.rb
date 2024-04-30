class ApplicationController < ActionController::API
  before_action :authorize

  private

  def authorize
    token = request.headers['Authorization']&.split(' ')&.last
    JWT.decode(token, ENV['JWT_SECRET'], true, algorithm: 'HS256')
  rescue JWT::DecodeError => e
    render json: { errors: [{ message: e.message }] }, status: 401
  end
end
