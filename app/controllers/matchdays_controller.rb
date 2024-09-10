class MatchdaysController < ApplicationController
  def index
    @matchdays = Matchday.all
    @matchday = Matchday.next
  end

  def show
    @matchday = Matchday.find(params[:id])
    @games = @matchday.games
  end
end
