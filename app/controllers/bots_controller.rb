# app/controllers/bots_controller.rb
class BotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bot, only: [:show, :edit, :update, :destroy]

  def index
    @bots = Bot.all
  end

  def show
    # @bots = Bot.find(set_bot)
  end

  def new
    @bot = Bot.new
  end

  def create
    @bot = Bot.new(bot_params)
    if @bot.save
      redirect_to @bot, notice: 'Bot was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bot.update(bot_params)
      redirect_to @bot, notice: 'Bot was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bot.destroy
    redirect_to bots_url, notice: 'Bot was successfully destroyed.'
  end

  private

  def set_bot
    @bot = Bot.find(params[:id])
  end

  def bot_params
    params.require(:bot).permit(:name, :description, :price_per_day, :user_id)
  end
end
