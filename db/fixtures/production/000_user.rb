10.times do |i|
  User.seed(:id,
    {
      id: i + 1,
      username: "user#{ i + 1 }",
      email: "user#{ i + 1 }@user.com",
      password: "password#{ i + 1 }",
    }
  )
end

2.times do |i|
  User.seed(:id,
    {
      id: i + 20,
      username: "admin#{ i + 1 }",
      email: "admin#{ i + 1 }@admin.com",
      password: "admin#{ i + 1 }",
      admin: true,
    }
  )
end
