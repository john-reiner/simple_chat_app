# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create!(screen_name: "mightyfineguy", email: "johnnyreiner@gmail.com", password: "asdfasdf", password_confirmation: "asdfasdf", image: "https://via.placeholder.com/50")

4.times do |number|
    User.create!(
        screen_name: "testuser#{number + 1}",
        email: "asdf#{number + 1}@asdf.com",
        password: "asdfasdf",
        password_confirmation: "asdfasdf",
        image: "https://via.placeholder.com/50"
    )
end

Chat.create!(name: "test chat 1")

Chat.create!(name: "test chat 2")

UserChat.create!(user_id: 1, chat_id: 1)
UserChat.create!(user_id: 2, chat_id: 1)
UserChat.create!(user_id: 3, chat_id: 2)
UserChat.create!(user_id: 4, chat_id: 2)
UserChat.create!(user_id: 3, chat_id: 1)


20.times do |number| 
    Message.create!(
        user_id: rand(1..3),
        chat_id: 1,
        content: "Test messsage #{number + 1}"
    )
end

10.times do |number| 
    Message.create!(
        user_id: rand(3..4),
        chat_id: 2,
        content: "Test messsage #{number + 1}"
    )
end