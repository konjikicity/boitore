# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Sentence.seed do |s|
  s.id = 1
  s.boin = "おんいいあ"
  s.normal= "こんにちは"
  s.mode_id = 1
end
Sentence.seed do |s|
  s.id = 2
  s.boin = "おんあんあ"
  s.normal = "こんばんわ"
  s.mode_id = 1
end
Sentence.seed do |s|
  s.id = 3
  s.boin =  "おあおう おあいあう"
  s.normal= "おはようございます"
  s.mode_id= 1
end
Sentence.seed do |s|
  s.id = 4
  s.boin = "えんあうおお おいおんえ"
  s.normal = "せんたくものとりこんで"
  s.mode_id= 2
end
Sentence.seed do |s|
  s.id = 5
  s.boin = "おおおお いあああ"
  s.normal = "そろそろいかなきゃ"
  s.mode_id = 2
end
Sentence.seed do |s|
  s.id = 6
  s.boin = "ああいあ えんいいあ えう"
  s.normal = "わたしはえんじにあです"
  s.mode_id = 2
end
Sentence.seed do |s|
  s.id = 7
  s.boin = "ああうう えっううう"
  s.normal = "まさちゅーせっつしゅう"
  s.mode_id = 3
end
Sentence.seed do |s|
  s.id = 8
  s.boin = "いおんおうおう いううあ いえん"
  s.normal = "きほんじょうほうぎじゅつしゃしけん"
  s.mode_id = 3
end
Sentence.seed do |s|
  s.id = 9
  s.boin = "いんえう いんあう いういあう"
  s.normal = "しんせつしんさつしつしさつ"
  s.mode_id = 3
end