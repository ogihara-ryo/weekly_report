$ ->
  $('#latest_report_button').click ->
    $.ajax({
      url: 'reports/latest_report'
      type: 'GET'
    }).done (data, stat, xhr) ->
      latest_report(data)

latest_report = (data) ->
  $('textarea#report_place').val(data.place)
  $('input#report_overwork').val(data.overwork)
  $('textarea#report_work').val(data.work)
  $('textarea#report_probrem').val(data.probrem)
  $('textarea#report_solution').val(data.solution)
  $('textarea#report_plan').val(data.plan)
  $('textarea#report_other').val(data.other)
