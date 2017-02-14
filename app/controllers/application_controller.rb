class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#before_action->before executing any controller perform this action
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

#allowing the parameter to be accepted by the devise (similar to params require under every controller)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_type])
  end

  before_action :set_name

    def set_name
      @name = "Pete"
    end
end
