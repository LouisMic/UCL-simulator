class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :predictions, dependent: :destroy
  after_create :create_predictions

  def create_predictions
    Game.all.each do |game|
      Prediction.create!(user: self, game: game, home_score: 0, away_score: 0)
    end
  end
end
