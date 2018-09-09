class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found

  def index
    render :plain => "Welcome to Language Learning via Penpal!"
  end

  def error
    render :plain => "Route not found."
  end

  def resource_not_found
    render :plain => "Resource not found."
  end

end
