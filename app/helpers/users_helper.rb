module UsersHelper
  def user_form_url(user)
    if user.new_record?
      create_users_path
    end
  end
end
