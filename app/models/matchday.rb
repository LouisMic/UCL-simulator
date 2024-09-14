class Matchday < ApplicationRecord
  has_many :games
  scope :next, -> { where('end_date > ?', DateTime.now).first }

  def round
    Matchday.all.find_index(self) + 1
  end
end
