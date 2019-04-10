class Song < ApplicationRecord
  validates :title, { presence: true, uniqueness: { scope: :release_year,
    message: "should happen once per year" }}
  validates :released, inclusion: { in: [true, false] ,
    message: "%{value} must be true or false" }
  validates :release_year, presence: true, if: :released?, numericality: {less_than_or_equal_to: Date.today.year,
    message: "must be in the past if released"}  
end
