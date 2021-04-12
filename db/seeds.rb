# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Casting.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

mgm = Studio.create!(name: "MGM", location: "Hollywood")

die_another_day = mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action Thriller")

pierce_brosnan = die_another_day.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
halle_berry = die_another_day.actors.create!(name: "Halle Berry", age: 54, currently_working: true)
never_was_in_this_movie = die_another_day.actors.create!(name: "Kon Ham", age: 31, currently_working: false)

golden_eye = mgm.movies.create!(title: "Goldeneye", creation_year: 1995, genre: "Action Thriller")

piece_brosnan_again = golden_eye.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
famke_janssen = golden_eye.actors.create!(name: "Famke Janssen", age: 56, currently_working: true)
