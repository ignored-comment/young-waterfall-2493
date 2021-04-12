require 'rails_helper'

RSpec.describe 'studios show page' do
  describe 'when I visit a studio show page' do
    it "shows me the studio's name and location and titles of all its movies" do
      mgm = Studio.create!(name: "MGM", location: "Hollywood")
      mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action/Thriller")

      visit "/studios/#{mgm.id}"

      save_and_open_page

      expect(page).to have_content("MGM")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("Die Another Day")
    end

    it "shows me a list of actors that have acted in any of the studio's movies" do
      mgm = Studio.create!(name: "MGM", location: "Hollywood")
      die_another_day = mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action Thriller")
      pierce_brosnan = die_another_day.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      halle_berry = die_another_day.actors.create!(name: "Halle Berry", age: 54, currently_working: true)
      never_was_in_this_movie = die_another_day.actors.create!(name: "Kon Ham", age: 31, currently_working: false)

      golden_eye = mgm.movies.create!(title: "Goldeneye", creation_year: 1995, genre: "Action Thriller")
      piece_brosnan_again = golden_eye.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      famke_janssen = golden_eye.actors.create!(name: "Famke Janssen", age: 56, currently_working: true)

      visit "/studios/#{mgm.id}"

      save_and_open_page

      expect(page).to have_content("MGM")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("Die Another Day")
    end
  end
end
