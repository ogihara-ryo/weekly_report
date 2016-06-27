$ ->
  $('#my_last_report').click ->
    $.ajax({
      url: 'reports/set_last_report_form'
      type: 'GET'
    }).done (data, stat, xhr) ->
      set_last_report_form(data)

set_last_report_form = (data) ->
  $('textarea#report_place').val(data.place)
  $('input#report_overwork').val(data.overwork)
  $('textarea#report_work').val(data.work)
  $('textarea#report_probrem').val(data.probrem)
  $('textarea#report_solution').val(data.solution)
  $('textarea#report_plan').val(data.plan)
  $('textarea#report_other').val(data.other)
