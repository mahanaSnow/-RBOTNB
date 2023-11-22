# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @user_bots = Bot.where(user: current_user)  # Assurez-vous que cette ligne reflète votre modèle et vos associations
    @rental_requests = Rental.where(bot: @user_bots)
    @my_rentals = Rental.where(user: current_user)  end
end
