module ApplicationHelper
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

  def weeks_ago(value)
    from = (Date.today - value.week).beginning_of_week
    to = (from + 6.day).end_of_day
    from..to
  end
end
