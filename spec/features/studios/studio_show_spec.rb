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
  end
end
