class ApplicationController < ActionController::API
  rescue_from StandardError, with: :render_exception

  def render_exception(exception)
    @error = exception.message if exception.respond_to? :message
    @error ||= exception.to_s
    render json: { error: exception.message }, status: 500
  end
  
end
