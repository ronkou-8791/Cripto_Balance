class GainsController < ApplicationController
  before_action :set_gain, only: [:show, :edit, :update, :destroy]

  # GET /gains
  # GET /gains.json
  def index
    @gains = Gain.all
    #@gains = CSV.read('BTC.csv')
    #@gains.each {|gain| Gain.create(purchase: Time.strptime(gain[0], "%Y年%m月%d日"), gain_price: gain[1].gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_i)}

  end

  # GET /gains/1
  # GET /gains/1.json
  def show
    id = params[:id] #=> id = 1
    purchase_price = params[:purchase_price] #=> purchase_price = '購入量'
    currrent_price = params[:currrent_price] #=> currrent_price = '売却量'

    gain_price = params[:gain_price] #=> gain_price = '終値'

  end

  # GET /gains/new
  def new
    @gain = Gain.new
  end

  # GET /gains/1/edit
  def edit
  end

  # POST /gains
  # POST /gains.json
  def create
    @gain = Gain.new(gain_params)
    #binding.pry
    start_day = "#{params[:gain][params[:gain].keys[0]]}-#{params[:gain][params[:gain].keys[1]]}-#{params[:gain][params[:gain].keys[2]]}"
    end_day = "#{params[:gain][params[:gain].keys[4]]}-#{params[:gain][params[:gain].keys[5]]}-#{params[:gain][params[:gain].keys[6]]}"
    format_start_day = Time.strptime(start_day, "%Y-%m-%d")
    format_end_day = Time.strptime(end_day, "%Y-%m-%d")


    @bit_coin = Gain.find_by(purchase: format_start_day).gain_price * params[:gain][:purchase_price].to_f
    @ask_coin = Gain.find_by(purchase: format_end_day).gain_price * params[:gain][:currrent_price].to_f
    respond_to do |format|
        format.html { render :show}
        # format.json { render :show, status: :created, location: @gain }
    end

  end

  # PATCH/PUT /gains/1
  # PATCH/PUT /gains/1.json
  def update
    respond_to do |format|
      if @gain.update(gain_params)
        format.html { redirect_to @gain, notice: 'Gain was successfully updated.' }
        format.json { render :show, status: :ok, location: @gain }
      else
        format.html { render :edit }
        format.json { render json: @gain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gains/1
  # DELETE /gains/1.json
  def destroy
    @gain.destroy
    respond_to do |format|
      format.html { redirect_to gains_url, notice: 'Gain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gain
      @gain = Gain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gain_params
      params.require(:gain).permit(:purchase, :sell, :gain_price, :purchase_price, :currrent_price)
    end
end
