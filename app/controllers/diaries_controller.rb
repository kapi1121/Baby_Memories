class DiariesController < ApplicationController
  before_action :set_baby
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
    @diaries = @baby.diaries
  end

  def show
  end

  def new
    @diary = @baby.diaries.new
  end

  def create
    @diary = @baby.diaries.new(diary_params)
    if @diary.save
      redirect_to baby_diary_path(@baby, @diary), notice: '日記が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to baby_diary_path(@baby, @diary), notice: '日記が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to baby_diaries_path(@baby), notice: '日記が削除されました。'
  end

  private

  def set_baby
    @baby = Baby.find(params[:baby_id])
  end

  def set_diary
    @diary = @baby.diaries.find(params[:id])
  end


  def diary_params
    params.require(:diary).permit(:entry_date, :content, :photo)
  end
end
