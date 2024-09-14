class MatchdaysController < ApplicationController
  include MatchdaysHelper

  def show
    @clubs = Club.select(:id, :name, :points, :goals_against, :goals_scored).rankings
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

    @clubs = Club.select(:id, :name, :points, :goals_against, :goals_scored).rankings

    respond_to do |format|
      format.html { redirect_to matchday_path(@matchday) } # Pour les requêtes standards
      format.js { render partial: "table", locals: { clubs: @clubs } } # Pour AJAX
    end
  end
end
