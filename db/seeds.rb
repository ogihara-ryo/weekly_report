Comment.delete_all
Comment.connection.execute(%|SELECT setval ('comments_id_seq', 1, false)|)
Report.delete_all
Report.connection.execute(%|SELECT setval ('reports_id_seq', 1, false)|)
User.delete_all
User.connection.execute(%|SELECT setval ('users_id_seq', 1, false)|)

1.upto(10) do |i|
  user = User.create(
    signin_id: "user#{i}",
    password: 'password',
    password_confirmation: 'password',
    name: "User Name#{i}"
  )

  report = Report.create(
    user: user,
    place: "user#{user.id}-place",
    overwork: user.id,
    work: "user#{user.id}-work",
    probrem: "user#{user.id}-probrem",
    solution: "user#{user.id}-solution",
    plan: "user#{user.id}-plan",
    other: "user#{user.id}-other"
  )

  Comment.create(
    user: user,
    report: report,
    description: "report#{report.id}-comment"
  )
end
