100.times do |i|
  Post.seed(:id,
    {
      id: i + 1,
      user_id: rand(1..10),
      title: "めがね#{ i + 1 }",
      price: rand(1..100)*100,
      body: "#{ i + 1 }番目のめがねの紹介です。",
      category_id: rand(1..8)
    }
  )
end