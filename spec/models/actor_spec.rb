require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many :castings}
    it {should have_many(:movies).through(:castings)}
  end

  describe '#search' do
    it 'returns partial matches' do
      mgm = Studio.create!(name: "MGM", location: "Hollywood")
      die_another_day = mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action Thriller")
      pierce_brosnan = die_another_day.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      halle_berry = die_another_day.actors.create!(name: "Halle Berry", age: 54, currently_working: true)
      never_was_in_this_movie = die_another_day.actors.create!(name: "Kon Ham", age: 31, currently_working: false)

      golden_eye = mgm.movies.create!(title: "Goldeneye", creation_year: 1995, genre: "Action Thriller")
      pierce_brosnan_again = golden_eye.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
      famke_janssen = golden_eye.actors.create!(name: "Famke Janssen", age: 56, currently_working: true)

      expect(Actor.search("Famke")).to eq([famke_janssen])
    end
  end

  it 'can generate list of actors that are unique, ordered oldest to youngest, and currently working is true' do
    mgm = Studio.create!(name: "MGM", location: "Hollywood")
    die_another_day = mgm.movies.create!(title: "Die Another Day", creation_year: 2002, genre: "Action Thriller")
    pierce_brosnan = die_another_day.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
    halle_berry = die_another_day.actors.create!(name: "Halle Berry", age: 54, currently_working: true)
    never_was_in_this_movie = die_another_day.actors.create!(name: "Kon Ham", age: 31, currently_working: false)

    golden_eye = mgm.movies.create!(title: "Goldeneye", creation_year: 1995, genre: "Action Thriller")
    pierce_brosnan_again = golden_eye.actors.create!(name: "Pierce Brosnan", age: 67, currently_working: true)
    famke_janssen = golden_eye.actors.create!(name: "Famke Janssen", age: 56, currently_working: true)

    expect(Actor.unique_and_ordered_by_age_working_true).to eq(["Pierce Brosnan", "Famke Janssen", "Halle Berry"])
  end
end
