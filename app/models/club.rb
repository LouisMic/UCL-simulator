class Club < ApplicationRecord
  has_many :home_games, class_name: "Game", foreign_key: :home_team_id, dependent: :destroy
  has_many :away_games, class_name: "Game", foreign_key: :away_team_id, dependent: :destroy
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :goals_scored, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :goals_against, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true

  def games
    Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end
end
