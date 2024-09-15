class Game < ApplicationRecord
  belongs_to :matchday
  belongs_to :home_team, class_name: "Club", foreign_key: :home_team_id
  belongs_to :away_team, class_name: "Club", foreign_key: :away_team_id
  validates :home_score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :away_score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def prediction(user)
    Prediction.find_by(user: user, game: self)
  end

  def name
    "#{home_team.name} - #{away_team.name}"
  end

  def date
    day_of_week = gametime.wday
    day_names = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    day_name = day_names[day_of_week]

    "#{day_name}, #{gametime.strftime("%d %b %Y")}"
  end

  def hour
    gametime.in_time_zone("Paris").strftime("%H:%M")
  end
end
