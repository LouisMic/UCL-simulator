class MatchdaysController < ApplicationController
  before_action :gather_predictions, only: [:index]
  def index
    @matchdays = Matchday.all
    @matchday = Matchday.next
    @games = @matchday.games
  end

  def show
    @matchdays = Matchday.all
    @matchday = Matchday.find(params[:id])
    @games = @matchday.games
  end

  def update_predictions
    @matchday = Matchday.find(params[:id])


    params[:matchday].each do |game_id, game_params|
      game = Game.find(game_id.to_i)
      prediction = game.prediction(current_user)
      prediction.update(game_params.permit(:home_score, :away_score))
      game.home_team.update_points(current_user)
      game.away_team.update_points(current_user)
    end
    redirect_to @matchday, notice: 'Prédictions mises à jour avec succès'
  end

  private

  def gather_predictions
    @predictions = current_user.predictions
    if @predictions.empty?
      Game.all.each do |game|
        Prediction.create!(user: current_user, game: game, home_score: 0, away_score: 0)
      end
    end
  end
end
