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
  s.boin =  "おあおうおあいあう"
  s.normal= "おはようございます"
  s.mode_id= 1
end
Sentence.seed do |s|
  s.id = 3
  s.boin = "おおいうおえあいいあう"
  s.normal= "よろしくおねがいします"
  s.mode_id= 1
end