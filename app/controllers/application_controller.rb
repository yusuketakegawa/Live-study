class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduce, :image])
  end

rescue_from Exception, with: :error500
rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

def error404(e)
  render "error404", status: 404, formats: [:html]
end

def error500(e)
  logger.error [e, *e.backtrace].join("\n")
  render "error500", status: 500, format: [:html]
end


end
