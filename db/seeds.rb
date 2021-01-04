# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Studio.destroy_all
Actor.destroy_all
Movie.destroy_all
MovieActor.destroy_all

fox = Studio.create!(name: "Fox", location: "California")
disney = Studio.create!(name: "Disney", location: "Florida")

star_wars = Movie.create!(title: "Star Wars", creation_year: 2019, studio: disney, genre: "scifi")
frozen = Movie.create!(title: "Frozen", creation_year: 2010, studio: disney, genre: "fantasy")

mhamil = Actor.create!(name: "Mark Hamil", age: 60)
cfischer = Actor.create!(name: "Carrie Fischer", age: 65)
emenzel = Actor.create!(name: "Edina Menzel", age: 45)
kbell = Actor.create!(name: "Kristen Bell", age: 44)

MovieActor.create!(movie: frozen, actor: emenzel)
MovieActor.create!(movie: frozen, actor: kbell)
MovieActor.create!(movie: star_wars, actor: mhamil)
MovieActor.create!(movie: star_wars, actor: cfischer)
