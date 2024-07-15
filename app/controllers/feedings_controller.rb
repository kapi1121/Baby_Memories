class FeedingsController < ApplicationController
    before_action :set_baby
    before_action :set_feeding, only: [:show, :edit, :update, :destroy]
  
    # GET /babies/:baby_id/feedings
    def index
      @feedings = @baby.feedings
    end
  
    # GET /babies/:baby_id/feedings/new
    def new
      @feeding = @baby.feedings.build
    rescue => e
      logger.error "Error initializing new feeding: #{e.message}"
      redirect_to babies_path, alert: "授乳記録の初期化中にエラーが発生しました。"
    end
  
    # POST /babies/:baby_id/feedings
    def create
      @feeding = @baby.feedings.build(feeding_params)
  
      if @feeding.save
        redirect_to baby_feedings_path(@baby), notice: '授乳記録が追加されました。'
      else
        render :new
      end
    rescue => e
      logger.error "Error creating feeding: #{e.message}"
      render :new
    end
  
    # GET /babies/:baby_id/feedings/:id/edit
    def edit
    end
  
    # PATCH/PUT /babies/:baby_id/feedings/:id
    def update
      if @feeding.update(feeding_params)
        redirect_to baby_feedings_path(@baby), notice: '授乳記録が更新されました。'
      else
        render :edit
      end
    end
  
    # DELETE /babies/:baby_id/feedings/:id
    def destroy
      @feeding.destroy
      redirect_to baby_feedings_path(@baby), notice: '授乳記録が削除されました。'
    end
  
    private
  
    def set_baby
      @baby = Baby.find(params[:baby_id])
    rescue ActiveRecord::RecordNotFound => e
      logger.error "Error finding baby with ID #{params[:baby_id]}: #{e.message}"
      redirect_to babies_path, alert: "指定された赤ちゃんが見つかりません。"
    end
  
    def set_feeding
      @feeding = @baby.feedings.find(params[:id])
    end
  
    def feeding_params
      params.require(:feeding).permit(:feeding_time, :amount)
    end
end
