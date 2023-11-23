class RentalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rental, only: [:accept, :decline]

  def index
    @rentals = current_user.rentals
  end

  def show
  end

  def create
    @rental = current_user.rentals.build(rental_params)
    @rental.status = 'pending'
    if @rental.save
      redirect_to dashboard_path, notice: 'Votre réservation a été effectuée avec succès.'    else
      render :new
    end
  end

  def accept
    if @rental.update(status: 'accepted')
      redirect_to dashboard_path, notice: 'Rental was successfully accepted.'
    else
      redirect_to rentals_path, alert: 'Unable to accept the rental.'
    end
  end

  def decline
    if @rental.update(status: 'declined')
      redirect_to rentals_path, notice: 'Rental was successfully declined.'
    else
      redirect_to rentals_path, alert: 'Unable to decline the rental.'
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:bot_id, :user_id, :start_date, :end_date, :status)
  end
end
