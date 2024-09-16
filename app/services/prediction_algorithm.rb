class PredictionAlgorithm
  def initialize(matchday, user)
    @matchday = matchday
    @user = user
    @games = @matchday.games.includes(:home_team, :away_team)
  end

  def call
    predictions_to_update = []
    @strength_cache = {}

    @games.each do |game|
      predictions_to_update << predict(game)
    end

    Prediction.import(predictions_to_update, on_duplicate_key_update: [:home_score, :away_score])
  end

  def team_strength(team)
    @strength_cache[team.id] ||= begin
      (team.coeff_full + team.coeff_last * 2) / 6 + Club::COUNTRIES[team.country] * 7
    end
  end

  def predict(game)
    randomness_factor = -> { rand(-2.0..2.0) }
    homefield = 1.25

    home_team = game.home_team
    away_team = game.away_team
    prediction = game.prediction(@user)

    home_strength = (team_strength(home_team) * homefield).fdiv(15).round - 2
    away_strength = (team_strength(away_team)).fdiv(15).round - 2

    adjust_strengths(home_strength, away_strength)

    home_random = randomness_factor.call
    away_random = randomness_factor.call

    home_score = [(home_strength + home_random).round, 0].max
    away_score = [(away_strength + away_random).round, 0].max


    prediction.assign_attributes(home_score: home_score, away_score: away_score)
    prediction
  end

  private

  def adjust_strengths(home_strength, away_strength)
    if home_strength < 0 && away_strength > 0
      away_strength -= home_strength
      home_strength = 0
    elsif away_strength < 0 && home_strength > 0
      home_strength -= away_strength
      away_strength = 0
    elsif home_strength < 0 && away_strength < 0
      home_strength += 2
      away_strength += 2
    elsif home_strength > 2.5 && away_strength > 2.5
      home_strength -= 1
      away_strength -= 1
    end
  end
end
