json.array!(@reports) do |report|
  json.extract! report, :id, :user_id, :place, :overwork, :work, :probrem, :solution, :plan, :other
  json.url report_url(report, format: :json)
end
