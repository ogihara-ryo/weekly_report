module ApplicationHelper
  def name_with_comment_count(report)
    report.comments.present? ? "#{report.user.name} (#{report.comments.count})" : report.user.name
  end
  
  def created_at_with_comment_count(report)
    l(report.created_at, format: :report) + render_comment_count(report)
  end

  def render_comment_count(report)
    " (#{report.comments.count})"
  end

  def page_title(title)
    title.blank? ? WeeklyReport::Application.config.title : "#{title} | #{WeeklyReport::Application.config.title}"
  end

  def all_day_of_week_ago(value)
    from = (Date.today - value.week).beginning_of_week.beginning_of_day
    to = (from + 6.day).end_of_day
    from..to
  end
end
