module ApplicationHelper
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def name_with_comment_count(report)
    report.comments.present? ? "#{report.user.name} (#{report.comments.count})" : report.user.name
  end

  def page_title(title)
    if title.blank?
      WeeklyReport::Application.config.title
    else
      "#{title} | #{WeeklyReport::Application.config.title}"
    end
  end
end
