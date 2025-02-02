require 'rails_helper'

RSpec.describe 'movies show page' do
  describe "when I visit a movie's show page" do
    it "shows me a movie's title, creation year, genre, and all of the actors in the movie" do
      mgm = Studio.create!(name: "MGM", location: "Hollywood")

      die_another_day = mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action Thriller")

      pierce_brosnan = die_another_day.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      halle_berry = die_another_day.actors.create!(name: "Halle Berry", age: 54, currently_working: true)

      visit "movies/#{die_another_day.id}"

      expect(page).to have_content("Die Another Day")
      expect(page).to have_content("2002")
      expect(page).to have_content("Action Thriller")
      expect(page).to have_content("Pierce Brosnan")
      expect(page).to have_content("Halle Berry")
    end

    it 'has a form to add an actor to the movie' do
      mgm = Studio.create!(name: "MGM", location: "Hollywood")

      die_another_day = mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action Thriller")

      pierce_brosnan = die_another_day.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      halle_berry = die_another_day.actors.create!(name: "Halle Berry", age: 54, currently_working: true)
      never_was_in_this_movie = die_another_day.actors.create!(name: "Kon Ham", age: 31, currently_working: false)

      golden_eye = mgm.movies.create!(title: "Goldeneye", creation_year: 1995, genre: "Action Thriller")

      piece_brosnan_again = golden_eye.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      famke_janssen = golden_eye.actors.create!(name: "Famke Janssen", age: 56, currently_working: true)

      visit "movies/#{die_another_day.id}"

      expect(page).to have_content("Pierce Brosnan")
      expect(page).to have_content("Halle Berry")
      expect(page).to have_content('Add an actor to this movie:')
      expect(page).to have_content('Name')

      fill_in "name", with: "Famke"
      click_button "Submit"

      expect(page).to have_content("Famke Janssen")
    end
  end
end
