class EthbtcsController < ApplicationController
  before_action :set_ethbtc, only: [:show, :edit, :update, :destroy]

  # GET /ethbtcs
  # GET /ethbtcs.json
  def index
    #binding.pry
    @ethbtcs = Ethbtc.all
    #@ethbtcs = CSV.read('eth-btc-max.csv')
    #binding.pry
    #@ethbtcs.each {|ethbtc| Ethbtc.create(buy: Time.strptime(ethbtc[0], "%Y年%m月%d日"), price: ethbtc[1].gsub(/(\d{0,3}),(\d{3})/, '\1\2').to_f)}

  end

  # GET /ethbtcs/1
  # GET /ethbtcs/1.json
  def show
    id = params[:id] #=> id = 1
    buy = params[:buy] #=> buy = '購入日'
    buy_size = params[:buy_size] #=> buy_size = '購入量'
    sell = params[:sell]  #=> sell = '売却日'
    sell_size = params[:sell_size]  #=> sell_size = '売却量'
    price = params[:price] #=> price = '相場'
  end

  # GET /ethbtcs/new
  def new
    @ethbtc = Ethbtc.new
  end

  # GET /ethbtcs/1/edit
  def edit
  end

  # POST /ethbtcs
  # POST /ethbtcs.json
  def create
    @ethbtc = Ethbtc.new(ethbtc_params)
    #binding.pry
    start_day = "#{params[:ethbtc][params[:ethbtc].keys[0]]}-#{params[:ethbtc][params[:ethbtc].keys[1]]}-#{params[:ethbtc][params[:ethbtc].keys[2]]}"
    end_day = "#{params[:ethbtc][params[:ethbtc].keys[4]]}-#{params[:ethbtc][params[:ethbtc].keys[5]]}-#{params[:ethbtc][params[:ethbtc].keys[6]]}"
    format_start_day = Time.strptime(start_day, "%Y-%m-%d").to_s(:db)
    format_end_day = Time.strptime(end_day, "%Y-%m-%d").to_s(:db)

    #binding.pry
    @bit_coin = Ethbtc.find_by(buy: format_start_day).price * params[:ethbtc][:buy_size].to_f
    @ask_coin = Ethbtc.find_by(buy: format_end_day).price *  params[:ethbtc][:sell_size].to_f
    respond_to do |format|
        format.html { render :show}
        # format.json { render :show, status: :created, location: @ethbtc }
    end
  end

  # PATCH/PUT /ethbtcs/1
  # PATCH/PUT /ethbtcs/1.json
  def update
    respond_to do |format|
      if @ethbtc.update(ethbtc_params)
        format.html { redirect_to @ethbtc, notice: 'Ethbtc was successfully updated.' }
        format.json { render :show, status: :ok, location: @ethbtc }
      else
        format.html { render :edit }
        format.json { render json: @ethbtc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ethbtcs/1
  # DELETE /ethbtcs/1.json
  def destroy
    @ethbtc.destroy
    respond_to do |format|
      format.html { redirect_to ethbtcs_url, notice: 'Ethbtc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ethbtc
      @ethbtc = Ethbtc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ethbtc_params
      params.require(:ethbtc).permit(:buy, :buy_size, :sell, :sell_size, :price)
    end
end
