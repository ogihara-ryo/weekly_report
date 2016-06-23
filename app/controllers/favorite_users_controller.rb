class FavoriteUsersController < ApplicationController
  before_action :set_user, only: :toggle

  def index
    @favorite_reports = Report.where(user: current_user.favorite_users).page(params[:page])
  end

  def toggle
    pair = { from: current_user, to: @user }
    if current_user.favorite_user_relations.exists?(pair)
      current_user.favorite_user_relations.find_by(pair).destroy
    else
      current_user.favorite_user_relations.create(pair)
    end
    redirect_to :back
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
