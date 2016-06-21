module ReportsHelper
  def favorite
    FavoriteUserRelation.exists?(from: current_user, to: @report.user)
  end
end
