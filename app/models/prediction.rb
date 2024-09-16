class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :game
  after_update :update_rankings

  def update_rankings
    game.home_team.update_points(user)
    game.away_team.update_points(user)
  end
end
