require 'rails_helper'

RSpec.describe "Index Page" do
  it "can show studios and their respective movies" do
    fox = Studio.create!(name: "Fox", location: "California")
    disney = Studio.create!(name: "Disney", location: "Florida")

    star_wars = Movie.create!(title: "Star Wars", creation_year: 2019, studio: disney)
    frozen = Movie.create!(title: "Frozen", creation_year: 2010, studio: disney)
    bond = Movie.create!(title: "Bond", creation_year: 2021, studio: fox)
    xmen = Movie.create!(title: "Xmen", creation_year: 2012, studio: fox)

    visit '/studios'

    within("#studio-#{disney.id}") do
      expect(page).to have_content(star_wars.title)
      expect(page).to have_content(frozen.title)
    end

    within("#studio-#{fox.id}") do
      expect(page).to have_content(bond.title)
      expect(page).to have_content(xmen.title)
    end
  end
end
