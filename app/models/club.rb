class Club < ApplicationRecord
  has_many :home_games, class_name: "Game", foreign_key: :home_team_id, dependent: :destroy
  has_many :away_games, class_name: "Game", foreign_key: :away_team_id, dependent: :destroy
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :goals_scored, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :goals_against, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true

  COUNTRIES = {
    "England" => 5,
    "Spain" => 5,
    "Germany" => 5,
    "Italy" => 5,
    "France" => 4,
    "Netherlands" => 4,
    "Portugal" => 4,
    "Ukraine" => 3,
    "Belgium" => 3,
    "Austria" => 3,
    "Scotland" => 2,
    "Serbia" => 2,
    "Czech Republic" => 2,
    "Slovakia" => 1,
    "Switzerland" => 1,
    "Croatia" => 1,
  }

  def games
    Game.where("home_team_id = ? OR away_team_id = ?", self.id, self.id)
  end

  def predictions(user)
    Prediction.where(game: games, user: user)
  end

  def update_points(user)
    self.points = 0
    self.goals_scored = 0
    self.goals_against = 0
    self.predictions(user).each do |prediction|
      prediction.game.home_team == self ? self.goals_scored += prediction.home_score : self.goals_scored += prediction.away_score
      prediction.game.home_team == self ? self.goals_against += prediction.away_score : self.goals_against += prediction.home_score
      calculate_points(prediction)
    end
    save
  end

  def calculate_points(prediction)
    if prediction.home_score == prediction.away_score
      self.points += 1
    elsif prediction.game.home_team == self && prediction.home_score > prediction.away_score
      self.points += 3
    elsif prediction.game.away_team == self && prediction.away_score > prediction.home_score
      self.points += 3
    end
  end

  def self.rankings
    Club.includes(:home_games, :away_games).all.sort_by { |club| [club.points, club.goals_scored - club.goals_against] }.reverse
  end
end
