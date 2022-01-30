# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(screen_name: "mightyfineguy", email: "johnnyreiner@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", image: "https://via.placeholder.com/50")

10.times do |usr|
    User.create!(
        screen_name: "testuser#{usr + 1}",
        email: "testuser#{usr + 1}@notgmail.com",
        password: "password#{usr + 1}",
        password_confirmation: "password#{usr + 1}",
        image: "https://via.placeholder.com/50"
    )
end

20.times do |chat|
    Chat.create!(
        name: "test chat #{chat + 1}"
    )
end

50.times do
    Message.create!(
        user_id: rand(1..11),
        chat_id: rand(1..20),
        content: Faker::TvShows::SouthPark.quote
    )
end