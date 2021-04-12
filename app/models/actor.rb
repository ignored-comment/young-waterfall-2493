class Actor < ApplicationRecord
  has_many :castings
  has_many :movies, through: :castings

  def self.unique_and_ordered_by_age_working_true
    where(currently_working: true).order(age: :desc).pluck(:name).uniq
  end
end
