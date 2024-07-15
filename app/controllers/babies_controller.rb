class BabiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @babies = current_user.babies
  end

  def show
    @baby = current_user.babies.find(params[:id])
  end

  def new
    @baby = current_user.babies.build
  end

  def create
    @baby = current_user.babies.build(baby_params)
    if @baby.save
      redirect_to @baby, notice: 'Baby was successfully created.'
    else
      render :new
    end
  end

  private

  def baby_params
    params.require(:baby).permit(:name, :birth_date, :height, :weight)
  end
end
