class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!, unless: :skip_verify_user?

  layout :get_layout

  private

  def get_layout
    if devise_controller? && !is_edit_profile?
      "devise"
    else
      "application"
    end
  end

  def is_edit_profile?
    controller_name == "registrations" && action_name.in?([ "edit", "update" ])
  end

  def skip_verify_user?
    controller_name == "home"
  end
end
