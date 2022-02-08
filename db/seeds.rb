# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(screen_name: "testuser1", email: "johnnyreiner@gmail.com", password: "asdf", password_confirmation: "asdf", image: "https://via.placeholder.com/50")
User.create!(screen_name: "testuser2", email: "johnreiner@gmail.com", password: "asdf", password_confirmation: "asdf", image: "https://via.placeholder.com/50")