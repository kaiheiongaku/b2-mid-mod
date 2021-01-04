require 'rails_helper'

RSpec.describe "Show Page" do
  before :each do
    @disney = Studio.create!(name: "Disney", location: "Florida")
    @frozen = Movie.create!(title: "Frozen", creation_year: 2010, studio: @disney, genre: "fantasy")
    @emenzel = Actor.create!(name: "Edina Menzel", age: 45)
    @kbell = Actor.create!(name: "Kristen Bell", age: 44)

    MovieActor.create!(movie: @frozen, actor: @emenzel)
    MovieActor.create!(movie: @frozen, actor: @kbell)
  end

  describe "for a particular movie" do
    it "shows the movie's information" do

      visit "movies/#{@frozen.id}"

      expect(page).to have_content(@frozen.title)
      expect(page).to have_content(@frozen.creation_year)
      expect(page).to have_content(@frozen.genre)
    end

    it "lists all of its actors from youngest to oldest" do

      visit "movies/#{@frozen.id}"

      expect(page).to have_content("Edina Menzel")
      expect(page).to have_content("Kristen Bell")

      Actor.order('age desc').all.expect == [@emenzel, @kbell]
    end

    it "shows the average age of the actors for the movie" do

      visit "movies/#{@frozen.id}"

    end
  end
end
