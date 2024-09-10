class ClubsController < ApplicationController
  def index
    @clubs = Club.rankings
    @matchday = Matchday.next
  end
end
