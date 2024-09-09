class Club < ApplicationRecord
  has_many :home_games, class_name: "Game", foreign_key: :home_team_id, dependent: :destroy
  has_many :away_games, class_name: "Game", foreign_key: :away_team_id, dependent: :destroy

  def games
    Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end
end
