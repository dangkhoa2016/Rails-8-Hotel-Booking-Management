class ApplicationController < ActionController::Base
  include Pagy::Backend

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :set_locale
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

  def set_locale(&action)
    locale = params[:locale] || cookies[:locale] || extract_locale_from_accept_language_header
    locale = I18n.available_locales.map(&:to_s).include?(locale) ? locale : I18n.default_locale
    cookies[:locale] = locale
    @pagy_locale = locale.to_s
    I18n.with_locale(locale, &action)
  end

  def extract_locale_from_accept_language_header
    request.env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first
  end
end
