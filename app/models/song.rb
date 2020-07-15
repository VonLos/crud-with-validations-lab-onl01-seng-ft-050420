class Song < ApplicationRecord
validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name], message: "Only one artist with a song this name per year"}
validates :released, inclusion: { in: [true, false] }
validates :release_year, presence: true, unless: -> {self.released == false }, numericality: { less_than_or_equal_to: DateTime.now.year}
end
