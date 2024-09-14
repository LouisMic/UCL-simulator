class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @matchday = Matchday.next
  end
end
