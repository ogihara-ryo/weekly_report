module ApplicationHelper
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end
end
