# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# numbers = (0...200).to_a


# 10.times do
#     tape = Tape.create(title: "title number #{numbers.sample}", artist: "sam", tracks: 5, genre: 'rnb', artcover: 'random', likes: 0, features: "nas", user_id: User.ids.sample)
# end


count = 0 
tapes = 512

count = 0

tapes.times do 
    system('clear')
    puts "Seeding MixTape Data"
    puts "-----------------"
    count += 1
    puts "#{count/tapes.to_f*100}%"
    tap = Tape.create(created_at: (0..30).to_a.sample.days.ago, artcover: "https://loremflickr.com/320/240?random=#{(0...999).to_a.sample}", title: Faker::tap.title, artist: Faker::tap.artist, features: Faker::Lorem.paragraph(sentence_count: 1, supplemental: false, random_sentences_to_add: 2))
end
