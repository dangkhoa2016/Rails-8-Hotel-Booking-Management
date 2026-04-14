class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :set_locale
  before_action :authenticate_user!, unless: :skip_verify_user?
  before_action :authorize_resource!, if: :pundit_authorization_required?

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

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def pundit_authorization_required?
    return false if devise_controller? || controller_name == "home"

    resource_model_class.present? && action_name.in?(%w[index show new create edit update destroy])
  end

  def authorize_resource!
    authorize(pundit_authorization_record)
  end

  def pundit_authorization_record
    if action_name.in?(%w[index new create])
      resource_model_class
    else
      resource_model_class.find(params.expect(:id))
    end
  end

  def resource_model_class
    @resource_model_class ||= controller_name.singularize.classify.safe_constantize
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back_or_to(root_path)
  end
end
