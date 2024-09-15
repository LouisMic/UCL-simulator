class UsersController < ApplicationController

  def algo
    @user = current_user
    @algo_predictions = User.find_by(email: "algo@yahoo.fr").predictions
    @algo_predictions.each do |prediction|
      @user.predictions.find_by(game: prediction.game).update!(
        home_score: prediction.home_score,
        away_score: prediction.away_score
      )
    end
    redirect_to matchday_path(Matchday.next)
  end
end
