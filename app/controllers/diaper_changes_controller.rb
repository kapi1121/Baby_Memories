class DiaperChangesController < ApplicationController
  before_action :set_baby
  before_action :set_diaper_change, only: [:show, :edit, :update, :destroy]

  def index
    @diaper_changes = @baby.diaper_changes
  end

  def show
  end

  def new
    @diaper_change = @baby.diaper_changes.new
  end

  def create
    @diaper_change = @baby.diaper_changes.new(diaper_change_params)
    if @diaper_change.save
      redirect_to baby_diaper_changes_path(@baby, @diaper_change), notice: 'おむつ交換記録が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @diaper_change = DiaperChange.find(params[:id])
    if @diaper_change.update(diaper_change_params)
      redirect_to baby_diaper_change_path(@baby, @diaper_change), notice: 'おむつ交換記録が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @diaper_change.destroy
    redirect_to baby_diaper_changes_path(@baby), notice: 'おむつ交換記録が削除されました。'
  end

  private

  def set_baby
    @baby = Baby.find(params[:baby_id])
  end

  def set_diaper_change
    @diaper_change = @baby.diaper_changes.find(params[:id])
  end

  def diaper_change_params
    params.require(:diaper_change).permit(:change_time, :change_type)
  end
end
