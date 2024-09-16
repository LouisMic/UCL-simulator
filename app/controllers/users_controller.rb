class UsersController < ApplicationController

  def algo
    @user = current_user
    @matchdays = Matchday.all
    @matchdays.each do |matchday|
      PredictionAlgorithm.new(matchday, @user).call
    end
    redirect_to matchday_path(Matchday.next)
  end
end
