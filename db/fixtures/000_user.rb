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
