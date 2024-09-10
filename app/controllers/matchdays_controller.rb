class MatchdaysController < ApplicationController
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
    redirect_to @matchday
  end
end
