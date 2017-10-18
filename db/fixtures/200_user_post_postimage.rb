

100.times do |i|
  PostImage.seed(:id,
    {
      id: i + 1,
      post_id: i + 1,
      image: Rails.root.join("db/fixtures/images/megane.png").open
   },
    {
      id: i + 101,
      post_id: i + 1,
      image: Rails.root.join("db/fixtures/images/megane.png").open
   }
  )
end
