# app/controllers/rentals_controller.rb
class RentalsController < ApplicationController
  before_action :set_rental, only: [:accept, :decline]

  def index
    @rentals = Rental.all
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rentals_path, notice: 'Rental was successfully created.'
    else
      render :new
    end
  end

  def accept
    @rental.update(status: 'accepted')
    # Additional logic for when a rental is accepted
    redirect_to rentals_path, notice: 'Rental was successfully accepted.'
  end

  def decline
    @rental.update(status: 'declined')
    redirect_to rentals_path, notice: 'Rental was successfully declined.'
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:bot_id, :user_id, :start_date, :end_date, :status)
  end
end
