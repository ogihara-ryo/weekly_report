module SessionsHelper
  def signin(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    session[:user_id] = user.id
  end

  def signed_in?
    session[:user_id].present?
  end

  def signout
    session[:user_id] = nil
    cookies.delete(:remember_token)
  end
end
