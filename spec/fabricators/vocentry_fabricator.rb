Fabricator(:vocentry) do
  eng_word { %w(Butcher Baker Candlestick Bread).sample}
  eng_word { Faker::Lorem.word }
  eng_desc { Faker::Lorem.word }
  fr_word { Faker::Lorem.word }
  fr_desc { Faker::Lorem.word }
  sp_word { Faker::Lorem.word }
  sp_desc { Faker::Lorem.word }
end
