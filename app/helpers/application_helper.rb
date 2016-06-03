module ApplicationHelper
  def name_with_comment_count(report)
    report.comments.present? ? "#{report.user.name} (#{report.comments.count})" : report.user.name
  end

  def page_title(title)
    title.blank? ? WeeklyReport::Application.config.title : "#{title} | #{WeeklyReport::Application.config.title}"
  end

  def weeks_ago(value)
    from = (Date.today - value.week).beginning_of_week
    to = (from + 6.day).end_of_day
    from..to
  end
end
