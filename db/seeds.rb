# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  username: "about",
  full_name: "Ranting = Network!",
  email: "hello@ranting.my",
  password: "123456",
  password_confirmation: "123456",
  description: "Ranting is a link-in-bio platform that allows any Malaysian creators to showcase their work and social media profiles in a single, easy-to-share link ♥️"
)
