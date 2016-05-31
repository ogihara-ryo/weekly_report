class SessionsController < ApplicationController
  skip_before_action :signin_required

  def new
    redirect_to root_path if signed_in?
  end

  def create
    user = User.find_by(signin_id: session_params[:signin_id])
    if authenticated?(user)
      signin user
      redirect_back_or(root_path)
    else
      flash.now[:alert] = t('message_invalid_signin')
      render action: :new
    end
  end

  def destroy
    signout
    redirect_to signin_path
  end

  private

  def session_params
    params.require(:session).permit(:signin_id, :password)
  end

  def authenticated?(user)
    user && user.authenticate(session_params[:password])
  end
end
