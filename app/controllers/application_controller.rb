class ApplicationController < ActionController::API
  rescue_from StandardError, :with => :general_error

  def index
    render json: { message: "Welcome to Language Learning via Penpal!" }
  end

  def general_error(exception)
    render json: { message: exception.message }
  end

  def route_error
    render json: { message: "Route not found." }
  end

end
